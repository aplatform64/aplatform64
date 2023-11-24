#
# Main
#

declare ap64_command=''
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

(($# == 0)) && ap64_help && exit 1
while getopts ':ilckrjuontf:e:b:d:g:s:p:x:v:V:D:h' Option; do
  case "$Option" in
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
  h) ap64_help && exit ;;
  *) ap64_help && exit 1 ;;
  esac
done
bl64_dbg_set_level "$ap64_debug" && bl64_msg_set_level "$ap64_verbose" || exit $?
ap64_initialize "$ap64_command" || exit $?

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
*) bl64_check_show_undefined "$ap64_command" ;;
esac
bl64_msg_show_batch_finish $? "$ap64_command"
