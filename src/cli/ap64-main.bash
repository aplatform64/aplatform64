#
# Main
#

declare -i ap64_status=0
declare ap64_debug="$BL64_DBG_TARGET_NONE"
declare ap64_verbose="$BL64_MSG_VERBOSE_ALL"
declare ap64_command=''
declare ap64_command_tag=''

declare ap64_collection='all'
declare ap64_package="$BL64_LIB_DEFAULT"
declare ap64_path_root='/opt/ap64'
declare ap64_path_var='/var/opt/ap64'
declare ap64_user='ap64'
declare ap64_site='site'
declare ap64_host='all'
declare ap64_playbook=''

(($# == 0)) && ap64_help && exit 1
while getopts ':ilckrjuontf:e:b:d:g:s:p:x:V:D:h' Option; do
  case "$Option" in
  i)
    ap64_command='ap64_site_install'
    ap64_command_tag='install aplatform64'
    ;;
  j)
    ap64_command='ap64_site_bootstrap'
    ap64_command_tag='bootstrap aplatform64'
    ;;
  n)
    ap64_command='ap64_play_run'
    ap64_command_tag='run playbook'
    ;;
  o)
    ap64_command='ap64_site_remove'
    ap64_command_tag='remove site'
    ;;
  t)
    ap64_command='ap64_sites_list'
    ap64_command_tag='list sites'
    ;;
  l)
    ap64_command='ap64_play_list'
    ap64_command_tag='list playbooks'
    ;;
  c)
    ap64_command='ap64_site_create'
    ap64_command_tag='create site'
    ;;
  r)
    ap64_command='ap64_site_refresh'
    ap64_command_tag='refresh site'
    ;;
  u)
    ap64_command='ap64_site_upgrade'
    ap64_command_tag='upgrade collections'
    ;;
  k)
    ap64_command='ap64_node_add'
    ap64_command_tag='add node'
    ;;
  b) ap64_path_root="$OPTARG" ;;
  d) ap64_path_var="$OPTARG" ;;
  g) ap64_user="$OPTARG" ;;
  s) ap64_site="$OPTARG" ;;
  x) ap64_host="$OPTARG" ;;
  p) ap64_playbook="$OPTARG" ;;
  e) ap64_collection="$OPTARG" ;;
  f) ap64_package="$OPTARG" ;;
  V) ap64_verbose="$OPTARG" ;;
  D) ap64_debug="$OPTARG" ;;
  h) ap64_help && exit ;;
  *) ap64_help && exit 1 ;;
  esac
done
ap64_check_initialize "$ap64_debug" "$ap64_verbose" "$ap64_command" || exit 1

ap64_switch_user "$ap64_command" "$ap64_user" "$ap64_path_root" "$@" ||
  exit 1

bl64_msg_show_batch_start "$ap64_command_tag"
case "$ap64_command" in
'ap64_site_install') "$ap64_command" "$ap64_path_root" "$ap64_path_var" "$ap64_user" ;;
'ap64_site_bootstrap') "$ap64_command" "$ap64_path_root" "$ap64_path_var" "$ap64_user" ;;
'ap64_site_upgrade') "$ap64_command" "$ap64_collection" "$ap64_package" ;;
'ap64_sites_list') "$ap64_command" "$ap64_site" ;;
'ap64_play_list') "$ap64_command" "$ap64_site" "$ap64_playbook" ;;
'ap64_site_refresh') "$ap64_command" "$ap64_site" ;;
'ap64_site_create') "$ap64_command" "$ap64_site" ;;
'ap64_site_remove') "$ap64_command" "$ap64_site" ;;
'ap64_play_run') "$ap64_command" "$ap64_site" "$ap64_host" "$ap64_playbook" ;;
'ap64_node_add') "$ap64_command" "$ap64_site" "$ap64_host" ;;
*) bl64_check_show_undefined "$ap64_command" ;;
esac
ap64_status=$?

bl64_msg_show_batch_finish $ap64_status "$ap64_command_tag"
exit $ap64_status
