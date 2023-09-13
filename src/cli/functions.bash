function ap64_site_info() {
  bl64_dbg_app_show_function

  # shellcheck disable=SC2154
  bl64_msg_show_info "A:Platform64 Site     : ${AP64_SITE_CURRENT}" &&
    bl64_msg_show_info "Ansible Playbooks     : ${ANSIBLE_PLAYBOOK_DIR}" &&
    bl64_msg_show_info "Ansible Configuration : ${ANSIBLE_CONFIG}" &&
    bl64_msg_show_info "Ansible SSH Keys      : ${ANSIBLE_PRIVATE_KEY_FILE}" &&
    bl64_msg_show_info "Ansible Logs          : ${ANSIBLE_LOG_PATH}" &&
    bl64_msg_show_info "Ansible Inventory     : ${ANSIBLE_INVENTORY}" &&
    return 0
}

function ap64_site_install() {
  bl64_dbg_app_show_function "$@"
  local root="$1"
  local var="$2"
  local user="$3"
  local cli="${root}/${AP64_CLI}"

  bl64_msg_show_phase 'prepare installation environment'
  if [[ ! -d "$root" && ! -d "${var}/home" ]]; then
    bl64_msg_show_task "create base paths (${root}, ${var})"
    bl64_fs_create_dir \
      '0755' "$BL64_VAR_DEFAULT" "$BL64_VAR_DEFAULT" \
      "${root}" "${var}" ||
      return $?

    bl64_msg_show_task "create installation owner (${user})"
    bl64_iam_user_add "$user" "${var}/home" &&
      bl64_rbac_add_root "$user" ||
      return $?

    bl64_msg_show_task "normalize path ownership (${var})"
    bl64_fs_set_permissions "$BL64_VAR_DEFAULT" "$user" "$BL64_VAR_DEFAULT" "$var" ||
      return $?

    bl64_msg_show_task "promote A:Platform64 CLI (${BL64_SCRIPT_PATH}/${AP64_CLI} -> ${cli})"
    bl64_fs_copy_files \
      '0755' "$user" "$BL64_VAR_DEFAULT" \
      "${root}" \
      "${BL64_SCRIPT_PATH}/${AP64_CLI}" ||
      return $?
  else
    bl64_msg_show_info 'environment already prepared'
  fi

  bl64_rbac_run_command "$user" "$cli" \
    -j \
    -b "$root" \
    -d "$var" \
    -g "$user" ||
    return $?

  bl64_msg_show_info "Installation process Complete. A:Platform64 CLI is now available at: ${cli}"
}

function ap64_site_bootstrap() {
  bl64_dbg_app_show_function "$@"
  local root="$1"
  local var="$2"
  local user="$3"
  local modules='ansible'
  local playbook='serdigital64/automation/roles/auto_aplatform64/files/playbooks/manage_aplatform64_servers.yml'

  bl64_msg_show_phase 'install Ansible Python modules'
  bl64_fs_set_ephemeral "$AP64_PATH_VENV_TMP" "$AP64_PATH_VENV_CACHE" &&
    bl64_py_setup "$AP64_PATH_VENV" &&
    bl64_py_pip_usr_prepare &&
    bl64_py_pip_usr_install "$modules" &&
    bl64_ans_setup "$BL64_VAR_DEFAULT" "$BL64_VAR_DEFAULT" "$BL64_VAR_OFF" ||
    return $?

  bl64_msg_show_phase 'install A:Platform64 Ansible collections'
  # shellcheck disable=SC2086
  if [[ ! -f "${BL64_ANS_PATH_USR_COLLECTIONS}/${playbook}" ]]; then
    bl64_ans_collections_install $AP64_COLLECTIONS ||
      return $?
  else
    bl64_dbg_app_show_info 'A:Platform64 already installed'
  fi

  bl64_msg_show_phase 'configure A:Platform64'
  if [[ ! -f "${root}/bin/site/${AP64_FILE_ANSIBLE_CONTROL}" ]]; then
    bl64_ans_run_ansible_playbook \
      --extra-vars "manage_aplatform64_servers_bootstrap='localhost'" \
      --extra-vars "auto_aplatform64_paths_control_root='${root}'" \
      --extra-vars "auto_aplatform64_paths_control_var='${var}'" \
      --extra-vars "auto_aplatform64_owners_control_user='${user}'" \
      --extra-vars "auto_aplatform64_owners_control_group='${user}'" \
      "${BL64_ANS_PATH_USR_COLLECTIONS}/${playbook}" ||
      return $?
  else
    bl64_dbg_app_show_info 'A:Platform64 already configured' return 0
  fi

  return 0
}

function ap64_site_upgrade() {
  bl64_dbg_app_show_function "$@"
  local collections="$1"
  local package="$2"
  local collection=''

  ap64_ansible_setup || return $?

  if [[ "$package" == "$BL64_VAR_DEFAULT" ]]; then
    if [[ "$collections" == 'all' ]]; then
      collections="$AP64_COLLECTIONS"
    fi

    # shellcheck disable=SC2164
    for collection in $collections; do
      bl64_msg_show_task "upgrade collection (${collection})" &&
        bl64_ans_collections_install "$collection" ||
        return $?
    done
  else
    bl64_msg_show_task "upgrade collection from package (${package})" &&
      bl64_ans_collections_install "$package"
  fi
}

function ap64_site_list() {
  bl64_dbg_app_show_function
  local site=''

  ap64_cli_path_set || return $?
  cd "${AP64_PATH_ROOT}/bin" || return $?
  for site in $(bl64_fs_find_files . "${AP64_FILE_ANSIBLE_CONTROL}"); do
    site="${site##\./}"
    site="${site%%/ansible_control.env}"
    ap64_site_load "$site" &&
      ap64_site_info ||
      return $?
  done
}

function ap64_play_list() {
  bl64_dbg_app_show_function "$@"
  local site="$1"
  local playbook="$2"
  declare -a record
  local catalog=''

  ap64_site_load "$site" || return $?
  # shellcheck disable=SC2154
  catalog="${ANSIBLE_PLAYBOOK_DIR}/${AP64_FILE_CATALOG}"
  bl64_check_file "$catalog" || return $?

  bl64_txt_run_awk \
    -F: \
    -v playbook="$playbook" \
    -v location="$ANSIBLE_PLAYBOOK_DIR" \
    -v inventory="$AP64_PATH_INVENTORY" \
    '
    $0 ~ /^$/ || $1 == "" { next }
    {
      print "playbook  : " $1
      print "purpose   : " $4
      print "path      : " location "/" $1
      print "inventory : " inventory "/" $2 ".ini"
      print "host group: " inventory "/group_vars/" $3
      print ""
    }
    ' "${catalog}"
}

function ap64_node_add() {
  bl64_dbg_app_show_function "$@"
  local site="$1"
  local node="$2"

  bl64_check_export 'AP64_NODE_USER' &&
    bl64_check_export 'AP64_NODE_PASSWORD' &&
    ap64_site_load "$site" &&
    ap64_ansible_setup ||
    return $?

  [[ "$node" == 'all' ]] &&
    bl64_msg_show_error 'invalid host name (all). Please use the -x Host parameter to specify a valid one' &&
    return 1

  # shellcheck disable=SC2154
  bl64_dbg_app_custom_1_enabled && ANSIBLE_CONFIG="$ANSIBLE_CONFIG_DEBUG"
  bl64_ans_run_ansible_playbook \
    -i "${AP64_PATH_INVENTORY}/${AP64_FILE_ANSIBLE_INVENTORY}" \
    --extra-vars "manage_aplatform64_nodes_phase='1'" \
    --extra-vars "auto_aplatform64_bootstrap_node_fqdn='${node}'" \
    "${ANSIBLE_PLAYBOOK_DIR}/manage_aplatform64_nodes.yml" ||
    return $?

  bl64_ans_run_ansible_playbook \
    -i "${AP64_PATH_INVENTORY}/${AP64_FILE_ANSIBLE_INVENTORY}" \
    --extra-vars "manage_aplatform64_nodes_phase='2'" \
    --extra-vars "auto_aplatform64_bootstrap_node_user='${AP64_NODE_USER}'" \
    --extra-vars "auto_aplatform64_bootstrap_node_password='${AP64_NODE_PASSWORD}'" \
    --limit "$node" \
    "${ANSIBLE_PLAYBOOK_DIR}/manage_aplatform64_nodes.yml"
}

function ap64_site_refresh() {
  bl64_dbg_app_show_function "$@"
  local site="$1"

  ap64_site_load "$site" &&
    ap64_ansible_setup ||
    return $?

  bl64_dbg_app_custom_1_enabled && ANSIBLE_CONFIG="$ANSIBLE_CONFIG_DEBUG"
  bl64_ans_run_ansible_playbook \
    -i "${AP64_PATH_INVENTORY}/${AP64_FILE_ANSIBLE_INVENTORY}" \
    "${ANSIBLE_PLAYBOOK_DIR}/manage_aplatform64_servers.yml"
}

function ap64_site_create() {
  bl64_dbg_app_show_function "$@"
  local site="$1"
  local source=''

  ap64_site_load 'site' &&
    ap64_ansible_setup ||
    return $?

  source="${AP64_PATH_ROOT}/bin/${site}/${AP64_FILE_ANSIBLE_CONTROL}"
  [[ -f "$source" ]] &&
    bl64_msg_show_error 'site is already created' && return 1

  bl64_dbg_app_custom_1_enabled && ANSIBLE_CONFIG="$ANSIBLE_CONFIG_DEBUG"
  bl64_ans_run_ansible_playbook \
    -i "${AP64_PATH_INVENTORY}/${AP64_FILE_ANSIBLE_INVENTORY}" \
    --extra-vars "auto_aplatform64_site='${site}'" \
    "${ANSIBLE_PLAYBOOK_DIR}/manage_aplatform64_servers.yml"
}

function ap64_play_run() {
  bl64_dbg_app_show_function "$@"
  local site="$1"
  local host="$2"
  local playbook="$3"
  local inventory=''
  local playbook_path=''
  declare -a record

  bl64_check_parameter 'playbook' 'playbook not selected. Please specify the playbook name using the "-p Playbook" option' &&
    ap64_site_load "$site" &&
    ap64_ansible_setup ||
    return $?

  bl64_dbg_app_show_info 'load playbook definition'
  # shellcheck disable=SC2207
  record=($(bl64_xsv_search_records \
    "$playbook" \
    "${ANSIBLE_PLAYBOOK_DIR}/${AP64_FILE_CATALOG}" \
    '1' \
    '1:2' \
    "$BL64_XSV_FS_COLON" \
    "$BL64_XSV_FS_TAB"))
  ((${#record} <= 2)) && bl64_msg_show_error 'unable to find requested playbook name' && return 1
  [[ -z ${record[0]} || -z ${record[1]} ]] && bl64_msg_show_error 'unable to find playbook definition' && return 1

  playbook_path="${ANSIBLE_PLAYBOOK_DIR}/${record[0]}.yml"
  inventory="${AP64_PATH_INVENTORY}/${record[1]}.ini"

  bl64_check_file "$inventory" &&
    bl64_check_file "$playbook_path" ||
    return $?

  if [[ "$host" != 'all' ]]; then
    host="--limit $host"
  else
    host=' '
  fi

  bl64_dbg_app_show_info 'run playbook'
  bl64_dbg_app_custom_1_enabled && ANSIBLE_CONFIG="$ANSIBLE_CONFIG_DEBUG"
  # shellcheck disable=SC2086
  bl64_ans_run_ansible_playbook \
    $host \
    -i "$inventory" \
    "$playbook_path"
}

function ap64_site_remove() {
  bl64_dbg_app_show_function "$@"
  local site="$1"
  local targets=''
  local path=''

  ap64_cli_path_set || return $?

  targets="${AP64_PATH_ROOT}/bin/${site}"
  targets="${targets} ${AP64_PATH_ROOT}/docs/${site}"
  targets="${targets} ${AP64_PATH_ROOT}/inventories/${site}"
  targets="${targets} ${AP64_PATH_ROOT}/files/${site}"
  targets="${targets} ${AP64_PATH_ROOT}/etc/cfg/${site}"
  targets="${targets} ${AP64_PATH_ROOT}/playbooks/${site}"
  targets="${targets} ${AP64_PATH_ROOT}/tests/${site}"
  targets="${targets} ${AP64_PATH_ROOT}/etc/keys/${site}"
  targets="${targets} ${AP64_PATH_ROOT}/vars/${site}"
  targets="${targets} ${AP64_PATH_ROOT}/templates/${site}"
  targets="${targets} ${AP64_PATH_ROOT}/roles/${site}"
  targets="${targets} ${AP64_PATH_ROOT}/etc/groups/${site}"
  targets="${targets} ${AP64_PATH_VAR}/logs/${site}"
  targets="${targets} ${AP64_PATH_VAR}/tmp/${site}"
  targets="${targets} ${AP64_PATH_VAR}/cache/${site}"
  targets="${targets} ${AP64_PATH_VAR}/persistence/${site}"
  targets="${targets} ${AP64_PATH_VAR}/var/groups/${site}"

  bl64_msg_show_phase "remove site components (${site})"
  for path in $targets; do
    if [[ -d "$path" ]]; then
      bl64_dbg_app_show_info "remove site component ($path)"
      bl64_fs_rm_full "$path"
    else
      bl64_msg_show_warning "site component not found (${path})"
    fi
  done

  return 0
}

function ap64_cli_path_set() {
  bl64_dbg_app_show_function
  local cli_root="${HOME}/${AP64_CLI_ROOT}"

  bl64_check_file "$cli_root" 'invalid installation. Verify that A:Platform64 was correctly installed and retry' &&
    AP64_PATH_ROOT="$(<"${cli_root}")" &&
    bl64_check_directory "$AP64_PATH_ROOT" 'invalid installation. Verify that A:Platform64 was correctly installed and retry'
}

function ap64_site_load() {
  bl64_dbg_app_show_function "$@"
  local site="${1:-}"
  local source=''

  bl64_check_parameter 'site' &&
    ap64_cli_path_set ||
    return $?

  source="${AP64_PATH_ROOT}/bin/${site}/${AP64_FILE_ANSIBLE_CONTROL}" &&
    bl64_check_file "$source" 'site definition not found. Create the site and try again' ||
    return $?

  bl64_msg_show_task "load site definition for the site: ${site}"
  # shellcheck disable=SC1090
  . "$source" ||
    {
      bl64_msg_show_error 'unable to load site definition'
      return 1
    }

  AP64_PATH_INVENTORY="$(bl64_fmt_dirname "$ANSIBLE_INVENTORY")"
  AP64_SITE_CURRENT="$site"
  return 0
}

function ap64_cli_user_switch() {
  bl64_dbg_app_show_function "$@"
  local command="$1"
  local user="$2"
  local path="$3"
  shift
  shift
  shift

  if [[ "$command" == 'ap64_site_install' ]]; then
    if [[ "$UID" != '0' ]]; then
      bl64_msg_show_info 're-running ap64 script as root to continue installation process'
      bl64_rbac_run_command 'root' "${BL64_SCRIPT_PATH}/${AP64_CLI}" "$@"
      exit $?
    else
      bl64_dbg_app_show_info 'already running as root, continue normal execution'
    fi
  else
    if [[ "$(bl64_iam_user_get_current)" != "$user" ]]; then
      bl64_check_user "$user" 'dedicated user for A:Platform64 not found. Please verify the installation and retry' || return $?
      bl64_msg_show_info "re-running ap64 script as the site owner (${user}) to continue requested operation"
      bl64_rbac_run_command "$user" "${path}/${AP64_CLI}" "$@"
      exit $?
    else
      bl64_dbg_app_show_info "already running as ${user}, continue normal execution"
    fi
  fi

  return 0
}

function ap64_ansible_setup() {
  bl64_dbg_app_show_function

  bl64_py_venv_check "$AP64_PATH_VENV" &&
    bl64_py_setup "$AP64_PATH_VENV" &&
    bl64_ans_setup "$BL64_VAR_DEFAULT" "$BL64_VAR_DEFAULT" "$BL64_VAR_OFF"
}

function ap64_initialize() {
  bl64_dbg_app_show_function
  local command="$1"

  bl64_check_parameter 'command' ||
    { ap64_help && return 1; }

  bl64_os_check_version \
    "${BL64_OS_ALM}-8" \
    "${BL64_OS_CNT}-8" \
    "${BL64_OS_DEB}-10" "${BL64_OS_DEB}-11" \
    "${BL64_OS_FD}-33" "${BL64_OS_FD}-35" \
    "${BL64_OS_OL}-8" \
    "${BL64_OS_RHEL}-8" \
    "${BL64_OS_RCK}-8" \
    "${BL64_OS_UB}-20" "${BL64_OS_UB}-21" "${BL64_OS_UB}-22" ||
    return $?

  AP64_PATH_VAR="$(bl64_fmt_dirname "$HOME")"
  AP64_PATH_VENV="${AP64_PATH_VAR}/${AP64_VENV}"
  AP64_PATH_VENV_CACHE="${AP64_PATH_VAR}/pip_cache"
  AP64_PATH_VENV_TMP="${AP64_PATH_VAR}/pip_tmp"

  bl64_dbg_app_show_vars 'AP64_PATH_VENV' 'AP64_PATH_VENV_CACHE' 'AP64_PATH_VENV_TMP'
  return 0
}

function ap64_help() {
  bl64_msg_show_usage \
    '<-i|-j|-c|-o|-r|-u|-l|-n|-t|-k> [-s Site] [-x Host] [-p Playbook] [-e Collection|-f Package] [-b Root] [-d Var] [-g User] [-V Verbose] [-D Debug] [-h]' \
    'A:Platform64 command line interface' '
  -i           : Install A:Platform64
  -j           : Bootstrap A:Platform64 (internal use only)
  -c           : Create a A:Platform64 site
  -o           : Remove a A:Platform64 site
  -r           : Refresh A:Platform64 site configuration by rerunning the setup process
  -u           : Upgrade A:Platform64 Ansible collections to the latest version in Ansible Galaxy
  -l           : List available playbooks
  -n           : Run playbook
  -t           : List sites
  -k           : Add managed node
    ' '
  -h           : Show usage info
    ' '
  -b Root      : APlatform64 root path. Default: /opt/ap64
  -d Var       : APlatform64 var path. Default: /var/opt/ap64
  -g User      : APlatform64 user name. Default: ap64
  -s Site      : Target Site. Defaul: site
  -x Host      : Target host for playbook run. Default: all
  -p Playbook  : Name of the playbook to run
  -e Collection: Collection name for the upgrade option (-u). Default: all
  -f Package   : Collection package file (-u). Default: none
  -V Verbose   : Set verbosity level. Format: one of BL64_MSG_VERBOSE_*
  -D Debug     : Enable debugging mode. Format: one of BL64_DBG_TARGET_*
  '

  return 0

}
