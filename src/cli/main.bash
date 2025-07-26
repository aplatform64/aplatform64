#
# Main
#

declare ap64_command=''
declare ap64_option=''
declare ap64_debug="$BL64_DBG_TARGET_NONE"
declare ap64_verbose="$BL64_MSG_VERBOSE_ALL"

declare ap64_collection='all'
declare ap64_host='all'
declare ap64_package="$BL64_VAR_DEFAULT"
declare ap64_path_root='/opt/ap64'
declare ap64_path_var='/var/opt/ap64'
declare ap64_playbook=''
declare ap64_site='site'
declare ap64_user='ap64'
declare ap64_version='2.13'

bl64_lib_script_version_set '5.1.1'
bl64_msg_help_usage_set '<-i|-c|-o|-r|-u|-l|-n|-t|-k> [-s Site] [-x Host] [-p Playbook] [-e Collection|-f Package] [-b Root] [-d Var] [-v Version] [-g User] [-V Verbose] [-D Debug] [-h]'
bl64_msg_help_about_set 'A:Platform64 command line interface'
# shellcheck disable=SC2016
bl64_msg_help_parameters_set \
  '-i           : Install A:Platform64
-j           : Bootstrap A:Platform64 (internal use only)
-c           : Create a A:Platform64 site
-o           : Remove a A:Platform64 site
-r           : Refresh A:Platform64 site configuration by rerunning the setup process
-u           : Upgrade A:Platform64 Ansible collections to the latest version in Ansible Galaxy
-l           : List available playbooks
-n           : Run playbook
-t           : List sites
-k           : Add managed node
-h           : Show usage info
-b Root      : APlatform64 root path. Default: /opt/ap64
-d Var       : APlatform64 var path. Default: /var/opt/ap64
-g User      : APlatform64 user name. Default: ap64
-v Version   : Ansible Core version for the controller node. Default: 2.13. Format: Major.Minor
-s Site      : Target Site. Defaul: site
-x Host      : Target host for playbook run. Default: all
-p Playbook  : Name of the playbook to run
-e Collection: Collection name for the upgrade option (-u). Default: all
-f Package   : Collection package file (-u). Default: none
-V Verbose   : Set verbosity level. Format: one of BL64_MSG_VERBOSE_*
-D Debug     : Enable debugging mode. Format: one of BL64_DBG_TARGET_*'

while getopts ':ilckrjuontf:e:b:d:g:s:p:x:v:V:D:h' ap64_option; do
  case "$ap64_option" in
  i) ap64_command='ap64_site_install' ;;
  j) ap64_command='ap64_site_bootstrap' ;;
  n) ap64_command='ap64_play_run' ;;
  o) ap64_command='ap64_site_remove' ;;
  t) ap64_command='ap64_site_list' ;;
  l) ap64_command='ap64_play_list' ;;
  c) ap64_command='ap64_site_create' ;;
  r) ap64_command='ap64_site_refresh' ;;
  u) ap64_command='ap64_site_upgrade' ;;
  k) ap64_command='ap64_node_add' ;;
  b) ap64_path_root="$OPTARG" ;;
  d) ap64_path_var="$OPTARG" ;;
  g) ap64_user="$OPTARG" ;;
  s) ap64_site="$OPTARG" ;;
  x) ap64_host="$OPTARG" ;;
  p) ap64_playbook="$OPTARG" ;;
  e) ap64_collection="$OPTARG" ;;
  f) ap64_package="$OPTARG" ;;
  v) ap64_version="$OPTARG" ;;
  V) ap64_verbose="$OPTARG" ;;
  D) ap64_debug="$OPTARG" ;;
  h) bl64_msg_help_show && exit 0 ;;
  *) bl64_msg_help_show && exit 1 ;;
  esac
done
bl64_dbg_set_level "$ap64_debug" && bl64_msg_set_level "$ap64_verbose" && ap64_initialize || exit $?

ap64_cli_user_switch "$ap64_command" "$ap64_user" "$ap64_path_root" "$@" ||
  exit 1

bl64_msg_show_batch_start "$ap64_command"
case "$ap64_command" in
'ap64_node_add') "$ap64_command" "$ap64_site" "$ap64_host" ;;
'ap64_play_list') "$ap64_command" "$ap64_site" "$ap64_playbook" ;;
'ap64_play_run') "$ap64_command" "$ap64_site" "$ap64_host" "$ap64_playbook" ;;
'ap64_site_bootstrap') "$ap64_command" "$ap64_path_root" "$ap64_path_var" "$ap64_user" "$ap64_version" ;;
'ap64_site_create') "$ap64_command" "$ap64_site" ;;
'ap64_site_install') "$ap64_command" "$ap64_path_root" "$ap64_path_var" "$ap64_user" "$ap64_debug" "$ap64_version" ;;
'ap64_site_list') "$ap64_command" ;;
'ap64_site_refresh') "$ap64_command" "$ap64_site" ;;
'ap64_site_remove') "$ap64_command" "$ap64_site" ;;
'ap64_site_upgrade') "$ap64_command" "$ap64_collection" "$ap64_package" ;;
*) bl64_check_show_undefined "${BL64_SCRIPT_ID}:$ap64_command" ;;
esac
bl64_msg_show_batch_finish $? "${BL64_SCRIPT_ID}:$ap64_command"
