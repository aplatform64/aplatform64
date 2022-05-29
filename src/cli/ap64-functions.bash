function ap64_install() {
  bl64_dbg_app_show_function "$@"
  local root="$1"
  local var="$2"
  local user="$3"
  local cli="${root}/${AP64_CLI}"

  bl64_msg_show_task 'prepare environment'
  if [[ ! -d "$root" && ! -d "${var}/home" ]]; then
    bl64_dbg_app_show_info 'create base paths' &&
      bl64_fs_create_dir \
        '0755' "$BL64_LIB_DEFAULT" "$BL64_LIB_DEFAULT" \
        "${root}" "${var}" &&
      bl64_dbg_app_show_info 'create environment owner' &&
      bl64_iam_user_add "$user" "${var}/home" &&
      bl64_rbac_add_root "$user" &&
      bl64_dbg_app_show_info "promote A:Platform64 CLI (${BL64_SCRIPT_PATH}/${AP64_CLI} -> ${cli})" &&
      bl64_fs_copy_files \
        '0755' "$user" "$BL64_LIB_DEFAULT" \
        "${root}" \
        "${BL64_SCRIPT_PATH}/${AP64_CLI}" ||
      return $?
  else
    bl64_dbg_app_show_info 'environment already prepared'
  fi

  bl64_dbg_app_show_info "run bootstrap as ${user} using sudo"
  bl64_rbac_run_command "$user" "$cli" \
    -j \
    -b "$root" \
    -d "$var" \
    -g "$user"
}

function ap64_bootstrap() {
  bl64_dbg_app_show_function "$@"
  local root="$1"
  local var="$2"
  local user="$3"
  local modules='ansible'
  local playbook='serdigital64/automation/roles/auto_aplatform64/files/playbooks/manage_aplatform64_servers.yml'

  bl64_msg_show_task 'install Ansible Python modules'
  bl64_py_setup &&
    bl64_py_pip_usr_prepare &&
    bl64_py_pip_usr_install "$modules" &&
    bl64_ans_setup ||
    return $?

  bl64_msg_show_task 'install A:Platform64 Ansible collections'
  if [[ ! -f "${BL64_ANS_PATH_USR_COLLECTIONS}/${playbook}" ]]; then
    bl64_ans_collections_install $AP64_COLLECTIONS ||
      return $?
  else
    bl64_dbg_app_show_info 'A:Platform64 already installed'
  fi

  bl64_msg_show_task 'configure A:Platform64'
  if [[ ! -f "${root}/bin/site/ansible_control.env" ]]; then
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

function ap64_upgrade() {
  bl64_dbg_app_show_function "$@"
  local collections="$1"
  local package="$2"
  local collection=''

  bl64_ans_setup || return $?
  if [[ "$package" == "$BL64_LIB_DEFAULT" ]]; then
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

function ap64_list_sites() {
  bl64_dbg_app_show_function "$@"
  local site="$1"

  ap64_load_site "$site" || return $?

  cd "${AP64_ROOT}/etc/keys" &&
    bl64_msg_show_text "Available sites: $(echo *)"
}

function ap64_list_plays() {
  bl64_dbg_app_show_function "$@"
  local site="$1"
  local playbook="$2"
  declare -a record
  local catalog=''

  ap64_load_site "$site" || return $?
  catalog="${ANSIBLE_PLAYBOOK_DIR}/catalog.csv"
  bl64_check_file "$catalog" || return $?

  bl64_txt_run_awk \
    -F: \
    -v playbook="$playbook" \
    -v location="$ANSIBLE_PLAYBOOK_DIR" \
    -v inventory="$AP64_INVENTORY" \
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

function ap64_add() {
  bl64_dbg_app_show_function "$@"
  local site="$1"
  local node="$2"

  bl64_check_export 'AP64_NODE_USER' &&
    bl64_check_export 'AP64_NODE_PASSWORD' &&
    ap64_load_site "$site" &&
    bl64_ans_setup ||
    return $?

  [[ "$node" == 'all' ]] &&
    bl64_msg_show_error 'invalid host name (all). Please use the -x Host parameter to specify a valid one' &&
    return 1

  bl64_ans_run_ansible_playbook \
    -i "${AP64_INVENTORY}/aplatform64_service.ini" \
    --extra-vars "auto_aplatform64_bootstrap_node_fqdn='${node}'" \
    --extra-vars "auto_aplatform64_bootstrap_node_user='${AP64_NODE_USER}'" \
    --extra-vars "auto_aplatform64_bootstrap_node_password='${AP64_NODE_PASSWORD}'" \
    "${ANSIBLE_PLAYBOOK_DIR}/manage_aplatform64_nodes.yml"
}

function ap64_refresh() {
  bl64_dbg_app_show_function "$@"
  local site="$1"

  ap64_load_site "$site" &&
    bl64_ans_setup ||
    return $?

  bl64_ans_run_ansible_playbook \
    -i "${AP64_INVENTORY}/aplatform64_service.ini" \
    "${ANSIBLE_PLAYBOOK_DIR}/manage_aplatform64_servers.yml"

}

function ap64_create() {
  bl64_dbg_app_show_function "$@"
  local site="$1"
  local source=''

  ap64_load_site 'site' || return $?

  source="${AP64_ROOT}/bin/${site}/ansible_control.env"
  [[ -f "$source" ]] &&
    bl64_msg_show_error 'site is already created' && return 1

  bl64_ans_setup &&
    bl64_ans_run_ansible_playbook \
      -i "${AP64_INVENTORY}/aplatform64_service.ini" \
      --extra-vars "auto_aplatform64_site='${site}'" \
      "${ANSIBLE_PLAYBOOK_DIR}/manage_aplatform64_servers.yml"

}

function ap64_run() {
  bl64_dbg_app_show_function "$@"
  local site="$1"
  local host="$2"
  local playbook="$3"
  local inventory=''
  local playbook_path=''
  declare -a record

  bl64_check_parameter 'playbook' 'playbook not selected. Please specify the playbook name using the "-p Playbook" option' &&
    ap64_load_site "$site" ||
    return $?

  bl64_dbg_app_show_info 'load playbook definition'
  # shellcheck disable=SC2207
  record=($(bl64_xsv_search_records \
    "$playbook" \
    "${ANSIBLE_PLAYBOOK_DIR}/catalog.csv" \
    '1' \
    '1:2' \
    "$BL64_XSV_FS_COLON" \
    "$BL64_XSV_FS_TAB"))
  playbook_path="${ANSIBLE_PLAYBOOK_DIR}/${record[0]}.yml"
  inventory="${AP64_INVENTORY}/${record[1]}.ini"

  bl64_check_file "$inventory" &&
    bl64_check_file "$playbook_path" ||
    return $?

  if [[ "$host" != 'all' ]]; then
    host="--limit $host"
  else
    host=' '
  fi

  bl64_dbg_app_show_info 'run playbook'
  bl64_ans_setup &&
    bl64_ans_run_ansible_playbook \
      $host \
      -i "$inventory" \
      "$playbook_path"
}

function ap64_remove() {
  bl64_dbg_app_show_function "$@"
  local site="$1"
  local targets=''
  local path=''

  ap64_load_site "$site" || return $?

  targets="${AP64_ROOT}/bin/${site}"
  targets="${targets} ${AP64_ROOT}/docs/${site}"
  targets="${targets} ${AP64_ROOT}/inventories/${site}"
  targets="${targets} ${AP64_ROOT}/files/${site}"
  targets="${targets} ${AP64_ROOT}/etc/cfg/${site}"
  targets="${targets} ${AP64_ROOT}/playbooks/${site}"
  targets="${targets} ${AP64_ROOT}/tests/${site}"
  targets="${targets} ${AP64_ROOT}/etc/keys/${site}"
  targets="${targets} ${AP64_ROOT}/vars/${site}"
  targets="${targets} ${AP64_ROOT}/templates/${site}"
  targets="${targets} ${AP64_ROOT}/roles/${site}"
  targets="${targets} ${AP64_ROOT}/etc/groups/${site}"
  targets="${targets} ${AP64_VAR}/logs/${site}"
  targets="${targets} ${AP64_VAR}/tmp/${site}"
  targets="${targets} ${AP64_VAR}/cache/${site}"
  targets="${targets} ${AP64_VAR}/persistence/${site}"
  targets="${targets} ${AP64_VAR}/var/groups/${site}"

  for path in $targets; do
    if [[ -d "$path" ]]; then
      bl64_dbg_app_show_info "remove site component ($path)"
      bl64_fs_rm_full "$path"
    fi
  done

  return 0
}

function ap64_load_site() {
  bl64_dbg_app_show_function "$@"
  local site="${1:-}"
  local source=''
  local cli_root="${HOME}/${AP64_CLI_ROOT}"

  bl64_check_file "$cli_root" 'invalid installation. Verify that A:Platform64 was correctly installed and retry' || return $?

  AP64_ROOT="$(<"${cli_root}")" &&
    bl64_check_directory "$AP64_ROOT" 'invalid installation. Verify that A:Platform64 was correctly installed and retry' ||
    return $?

  source="${AP64_ROOT}/bin/${site}/ansible_control.env" &&
    bl64_check_file "$source" 'site definition not found. Create the site and try again' ||
    return $?

  # shellcheck disable=SC1090
  . "$source"

  AP64_INVENTORY="$(bl64_fmt_dirname "$ANSIBLE_INVENTORY")"
  AP64_VAR="$(bl64_fmt_dirname "$HOME")"

}

function ap64_switch_user() {
  bl64_dbg_app_show_function "$@"
  local command="$1"
  local user="$2"
  local path="$3"
  shift
  shift
  shift

  if [[ "$command" == 'ap64_install' ]]; then
    if [[ "$UID" != '0' ]]; then
      bl64_dbg_app_show_info 're-entry installation as root using sudo'
      bl64_rbac_run_command 'root' "${BL64_SCRIPT_PATH}/${AP64_CLI}" "$@"
      exit $?
    else
      bl64_dbg_app_show_info 'already running as root, continue normal execution'
    fi
  else
    if [[ "$(bl64_iam_user_get_current)" != "$user" ]]; then
      bl64_check_user "$user" 'dedicated user for A:Platform64 not found. Please verify the installation and retry' || return $?
      bl64_dbg_app_show_info "re-entry CLI as ${user} using sudo"
      bl64_rbac_run_command "$user" "${path}/${AP64_CLI}" "$@"
      exit $?
    else
      bl64_dbg_app_show_info "already running as ${user}, continue normal execution"
    fi
  fi

  return 0
}

function ap64_setup_globals() {
  :
}

function ap64_check_requirements() {
  bl64_dbg_app_show_function "$@"

  [[ -z "$ap64_command" ]] && ap64_help && return 1

  return 0
}

function ap64_help() {
  bl64_msg_show_usage \
    '<-i|-j|-c|-o|-r|-u|-l|-n|-t|-k> [-s Site] [-x Host] [-p Playbook] [-e Collection|-f Package] [-b Root] [-d Var] [-g User] [-h]' \
    'A:Platform64 command line interface' '
  -i           : Install A:Platform64
  -j           : Bootstrap A:Platform64
  -c           : Create a A:Platform64 site
  -o           : Remove a A:Platform64 site
  -r           : Refresh A:Platform64 site configuration by rerunning the setup process
  -u           : Upgrade A:Platform64 Ansible collections to the latest version in Ansible Galaxy
  -l           : List available playbooks
  -n           : Run playbook
  -t           : List sites
  -k           : Add node
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
  '

  return 0

}
