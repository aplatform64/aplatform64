#!/bin/bash
#######################################
# BashLib64
#
# Author: serdigital64 (https://github.com/serdigital64)
# License: GPL-3.0-or-later (https://www.gnu.org/licenses/gpl-3.0.txt)
# Repository: https://github.com/serdigital64/bashlib64
# Version: 1.9.2
#######################################

[[ -n "$BL64_LIB_DEBUG" && "$BL64_LIB_DEBUG" == '1' ]] && set -x

readonly BL64_ARC_ERROR_MISSING_PARAMETER=200
readonly BL64_ARC_ERROR_INVALID_DESTINATION=201

readonly _BL64_ARC_TXT_MISSING_PARAMETER='required parameter is missing'
readonly _BL64_ARC_TXT_DST_NOT_DIRECTORY='the destination is not a directory'

readonly BL64_CHECK_ERROR_MISSING_PARAMETER=1

readonly BL64_CHECK_ERROR_FILE_NOT_FOUND=2
readonly BL64_CHECK_ERROR_FILE_NOT_READ=3
readonly BL64_CHECK_ERROR_FILE_NOT_EXECUTE=4

readonly BL64_CHECK_ERROR_DIRECTORY_NOT_FOUND=5
readonly BL64_CHECK_ERROR_DIRECTORY_NOT_READ=6

readonly BL64_CHECK_ERROR_PARAMETER_EMPTY=7


readonly _BL64_CHECK_TXT_MISSING_PARAMETER='required parameter is missing'

readonly _BL64_CHECK_TXT_COMMAND_NOT_FOUND='the command is not present'
readonly _BL64_CHECK_TXT_COMMAND_NOT_EXECUTABLE='the command is present but has no execution permission'

readonly _BL64_CHECK_TXT_FILE_NOT_FOUND='the file is not present'
readonly _BL64_CHECK_TXT_FILE_NOT_READABLE='the file is present but has no read permission'

readonly _BL64_CHECK_TXT_DIRECTORY_NOT_FOUND='the directory is not present'
readonly _BL64_CHECK_TXT_DIRECTORY_NOT_READABLE='the directory is present but has no read permission'

readonly BL64_LOG_TYPE_FILE='F'
readonly BL64_LOG_CATEGORY_INFO='info'
readonly BL64_LOG_CATEGORY_TASK='task'
readonly BL64_LOG_CATEGORY_DEBUG='debug'
readonly BL64_LOG_CATEGORY_WARNING='warning'
readonly BL64_LOG_CATEGORY_ERROR='error'
readonly BL64_LOG_CATEGORY_RECORD='record'

readonly BL64_LOG_ERROR_MISSING_PARAMETER=200
readonly BL64_LOG_ERROR_INVALID_TYPE=201
readonly BL64_LOG_ERROR_INVALID_VERBOSE=202
readonly BL64_LOG_ERROR_NOT_SETUP=203

readonly _BL64_LOG_TXT_NOT_SETUP='missing setup information. Please use the bl64_log_setup function before calling bl64_log_* functions'
readonly _BL64_LOG_TXT_MISSING_PARAMETER='required parameter is missing'
readonly _BL64_LOG_TXT_INVALID_TYPE='invalid log type. Please use any of BL64_LOG_TYPE_*'
readonly _BL64_LOG_TXT_INVALID_VERBOSE='invalid option for verbose. Please use 1 (enable) or 0 (disable)'

export BL64_LOG_PATH
export BL64_LOG_VERBOSE
export BL64_LOG_FS
export BL64_LOG_TYPE

readonly BL64_MSG_FORMAT_PLAIN='R'
readonly BL64_MSG_FORMAT_HOST='H'
readonly BL64_MSG_FORMAT_TIME='T'
readonly BL64_MSG_FORMAT_CALLER='C'
readonly BL64_MSG_FORMAT_FULL='F'

readonly BL64_MSG_ERROR_INVALID_FORMAT=200

readonly _BL64_MSG_TXT_USAGE='Usage'
readonly _BL64_MSG_TXT_COMMANDS='Commands'
readonly _BL64_MSG_TXT_FLAGS='Flags'
readonly _BL64_MSG_TXT_PARAMETERS='Parameters'
readonly _BL64_MSG_TXT_ERROR='Error'
readonly _BL64_MSG_TXT_INFO='Info'
readonly _BL64_MSG_TXT_TASK='Task'
readonly _BL64_MSG_TXT_DEBUG='Debug'
readonly _BL64_MSG_TXT_WARNING='Warning'
readonly _BL64_MSG_TXT_INVALID_FORMAT='invalid format. Please use one of BL64_MSG_FORMAT_*'

export BL64_MSG_FORMAT="${BL64_MSG_FORMAT:-$BL64_MSG_FORMAT_FULL}"

export BL64_OS_DISTRO

export BL64_OS_CMD_AWK
export BL64_OS_CMD_CAT
export BL64_OS_CMD_CHMOD
export BL64_OS_CMD_CHOWN
export BL64_OS_CMD_CP
export BL64_OS_CMD_CAT
export BL64_OS_CMD_DATE
export BL64_OS_CMD_HOSTNAME
export BL64_OS_CMD_GREP
export BL64_OS_CMD_ID
export BL64_OS_CMD_LN
export BL64_OS_CMD_LS
export BL64_OS_CMD_MKDIR
export BL64_OS_CMD_MKTEMP
export BL64_OS_CMD_MV
export BL64_OS_CMD_RM
export BL64_OS_CMD_TAR
export BL64_OS_CMD_USERADD

export BL64_OS_ALIAS_CHOWN_DIR
export BL64_OS_ALIAS_CP_FILE
export BL64_OS_ALIAS_ID_USER
export BL64_OS_ALIAS_LS_FILES
export BL64_OS_ALIAS_LN_SYMBOLIC
export BL64_OS_ALIAS_MKDIR_FULL
export BL64_OS_ALIAS_MV
export BL64_OS_ALIAS_RM_FILE
export BL64_OS_ALIAS_RM_FULL

readonly BL64_PKG_CMD_APT='/usr/bin/apt-get'
readonly BL64_PKG_CMD_DNF='/usr/bin/dnf'
readonly BL64_PKG_CMD_YUM='/usr/bin/yum'

readonly BL64_PKG_ALIAS_APT_UPDATE="$BL64_PKG_CMD_APT update"
readonly BL64_PKG_ALIAS_APT_INSTALL="$BL64_PKG_CMD_APT --assume-yes install"
readonly BL64_PKG_ALIAS_APT_CLEAN="$BL64_PKG_CMD_APT clean"
readonly BL64_PKG_ALIAS_DNF_CACHE="$BL64_PKG_CMD_DNF --color=never makecache"
readonly BL64_PKG_ALIAS_DNF_INSTALL="$BL64_PKG_CMD_DNF --color=never --nodocs --assumeyes install"
readonly BL64_PKG_ALIAS_DNF_CLEAN="$BL64_PKG_CMD_DNF clean all"

readonly BL64_SUDO_CMD_SUDO='/usr/bin/sudo'
readonly BL64_SUDO_CMD_VISUDO='/usr/sbin/visudo'
readonly BL64_SUDO_FILE_SUDOERS='/etc/sudoers'

readonly BL64_SUDO_ERROR_MISSING_PARAMETER=200
readonly BL64_SUDO_ERROR_MISSING_AWK=201
readonly BL64_SUDO_ERROR_MISSING_SUDOERS=202
readonly BL64_SUDO_ERROR_MISSING_VISUDO=203
readonly BL64_SUDO_ERROR_UPDATE_FAILED=210
readonly BL64_SUDO_ERROR_INVALID_SUDOERS=211

readonly _BL64_SUDO_TXT_MISSING_PARAMETER='required parameter is missing'
readonly _BL64_SUDO_TXT_INVALID_SUDOERS='the sudoers file is corrupt or invalid'

export BL64_SUDO_ALIAS_SUDO_ENV

readonly BL64_VCS_CMD_GIT='/usr/bin/git'

readonly BL64_VCS_ERROR_MISSING_PARAMETER=200
readonly BL64_VCS_ERROR_DESTINATION_ERROR=201

function bl64_arc_open_tar() {
  local source="$1"
  local destination="$2"
  local status=0

  if [[ -z "$source" || -z "$destination" ]]; then
    bl64_msg_show_error "$_BL64_ARC_TXT_MISSING_PARAMETER (source,destination)"
    return $BL64_ARC_ERROR_MISSING_PARAMETER
  fi

  if [[ ! -d "$destination" ]]; then
    bl64_msg_show_error "$_BL64_ARC_TXT_DST_NOT_DIRECTORY ($destination)"
    return $BL64_ARC_ERROR_INVALID_DESTINATION
  fi

  cd "$destination" || return 1

  "$BL64_OS_CMD_TAR" \
    --overwrite \
    --extract \
    --no-same-owner \
    --preserve-permissions \
    --no-acls \
    --force-local \
    --verbose \
    --auto-compress \
    --file="$source"
  status=$?

  ((status == 0)) && $BL64_OS_ALIAS_RM_FILE "$source"

  return $status

}

function bl64_check_command() {
  local path="$1"

  if [[ -z "$path" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_MISSING_PARAMETER (command path)"
    return $BL64_CHECK_ERROR_MISSING_PARAMETER
  fi
  if [[ ! -f "$path" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_COMMAND_NOT_FOUND ($path)"
    return $BL64_CHECK_ERROR_FILE_NOT_FOUND
  fi
  if [[ ! -x "$path" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_COMMAND_NOT_EXECUTABLE ($path)"
    return $BL64_CHECK_ERROR_FILE_NOT_EXECUTE
  fi
  :
}

function bl64_check_file() {
  local path="$1"

  if [[ -z "$path" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_MISSING_PARAMETER (file path)"
    return $BL64_CHECK_ERROR_MISSING_PARAMETER
  fi
  if [[ ! -f "$path" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_FILE_NOT_FOUND ($path)"
    return $BL64_CHECK_ERROR_FILE_NOT_FOUND
  fi
  if [[ ! -r "$path" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_FILE_NOT_READABLE ($path)"
    return $BL64_CHECK_ERROR_FILE_NOT_READ
  fi
  :
}

function bl64_check_directory() {
  local path="$1"

  if [[ -z "$path" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_MISSING_PARAMETER (directory path)"
    return $BL64_CHECK_ERROR_MISSING_PARAMETER
  fi
  if [[ ! -d "$path" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_DIRECTORY_NOT_FOUND ($path)"
    return $BL64_CHECK_ERROR_DIRECTORY_NOT_FOUND
  fi
  if [[ ! -r "$path" || ! -x "$path" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_DIRECTORY_NOT_READABLE ($path)"
    return $BL64_CHECK_ERROR_DIRECTORY_NOT_READ
  fi
  :
}

function bl64_check_parameter() {
  local parameter="$1"
  local description="${2:-parameter $parameter}"

  if [[ -z "$parameter" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_MISSING_PARAMETER (parameter name)"
    return $BL64_CHECK_ERROR_MISSING_PARAMETER
  fi

  if eval "[[ -z \$${parameter} ]]"; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_MISSING_PARAMETER ($description)"
    return $BL64_CHECK_ERROR_PARAMETER_EMPTY
  fi
  :
}

function bl64_fmt_strip_comments() {
  local source="${1:--}"

  "$BL64_OS_CMD_GREP" -v -E '^#.*$|^ *#.*$' "$source"

}

function _bl64_log_register() {

  local source="$1"
  local category="$2"
  local payload="$3"

  if [[
    -z "$BL64_LOG_PATH" || \
    -z "$BL64_LOG_VERBOSE" || \
    -z "$BL64_LOG_TYPE" || \
    -z "$BL64_LOG_FS"
  ]]; then
    bl64_msg_show_error "$_BL64_LOG_TXT_NOT_SETUP"
    return $BL64_LOG_ERROR_NOT_SETUP
  fi

  case "$BL64_LOG_TYPE" in
  "$BL64_LOG_TYPE_FILE")
    printf '%(%d%m%Y%H%M%S)T%s%s%s%s%s%s%s%s%s%s%s%s\n' \
      '-1' \
      "$BL64_LOG_FS" \
      "$HOSTNAME" \
      "$BL64_LOG_FS" \
      "$BL64_SCRIPT_NAME" \
      "$BL64_LOG_FS" \
      "$BL64_SCRIPT_SID" \
      "$BL64_LOG_FS" \
      "${source}" \
      "$BL64_LOG_FS" \
      "$category" \
      "$BL64_LOG_FS" \
      "$payload" >>"$BL64_LOG_PATH"
    ;;
  *)
    bl64_msg_show_error "$_BL64_LOG_TXT_INVALID_TYPE"
    return $BL64_MSG_ERROR_INVALID_FORMAT
  esac

}

function bl64_log_setup() {

  local path="$1"
  local verbose="${2:-1}"
  local type="${3:-$BL64_LOG_TYPE_FILE}"
  local fs="${4:-:}"

  if [[ -z "$path" ]]; then
    bl64_msg_show_error "$_BL64_LOG_TXT_MISSING_PARAMETER"
    return $BL64_LOG_ERROR_MISSING_PARAMETER
  fi

  if [[
    "$type" != "$BL64_LOG_TYPE_FILE"
  ]]; then
    bl64_msg_show_error "$_BL64_LOG_TXT_INVALID_TYPE"
    return $BL64_LOG_ERROR_INVALID_TYPE
  fi

  if [[
    "$verbose" != '0' && \
    "$verbose" != '1'
  ]]; then
    bl64_msg_show_error "$_BL64_LOG_TXT_INVALID_VERBOSE"
    return $BL64_LOG_ERROR_INVALID_VERBOSE
  fi

  BL64_LOG_PATH="${path}" && \
  BL64_LOG_VERBOSE="${verbose}" && \
  BL64_LOG_TYPE="${type}" && \
  BL64_LOG_FS="${fs}"

}

function bl64_log_info() {

  local payload="$1"
  local source="${2:-${FUNCNAME[1]}}"

  if [[ -n "$BL64_LOG_VERBOSE" && "$BL64_LOG_VERBOSE" == '1' ]]; then
    bl64_msg_show_info "$payload"
  fi

  _bl64_log_register \
    "${source:-main}" \
    "$BL64_LOG_CATEGORY_INFO" \
    "$payload"

}

function bl64_log_task() {

  local payload="$1"
  local source="${2:-${FUNCNAME[1]}}"

  if [[ -n "$BL64_LOG_VERBOSE" && "$BL64_LOG_VERBOSE" == '1' ]]; then
    bl64_msg_show_task "$payload"
  fi

  _bl64_log_register \
    "${source:-main}" \
    "$BL64_LOG_CATEGORY_TASK" \
    "$payload"

}

function bl64_log_error() {

  local payload="$1"
  local source="${2:-${FUNCNAME[1]}}"

  if [[ -n "$BL64_LOG_VERBOSE" && "$BL64_LOG_VERBOSE" == '1' ]]; then
    bl64_msg_show_error "$payload"
  fi

  _bl64_log_register \
    "${source:-main}" \
    "$BL64_LOG_CATEGORY_ERROR" \
    "$payload"

}

function bl64_log_warning() {

  local payload="$1"
  local source="${2:-${FUNCNAME[1]}}"

  if [[ -n "$BL64_LOG_VERBOSE" && "$BL64_LOG_VERBOSE" == '1' ]]; then
    bl64_msg_show_warning "$payload"
  fi

  _bl64_log_register \
    "${source:-main}" \
    "$BL64_LOG_CATEGORY_WARNING" \
    "$payload"

}

function bl64_log_record() {

  local tag="${1:-tag}"
  local source="${2:-${FUNCNAME[1]}}"
  local input_log_line=''

  case "$BL64_LOG_TYPE" in
  "$BL64_LOG_TYPE_FILE")
    while read -r input_log_line; do
      _bl64_log_register \
        "${source:-main}" \
        "$BL64_LOG_CATEGORY_RECORD" \
        "${tag}${BL64_LOG_FS}${input_log_line}"
    done
    ;;
  esac

}

function _bl64_msg_show() {

  local type="$1"
  local message="$2"

  case "$BL64_MSG_FORMAT" in
  "$BL64_MSG_FORMAT_PLAIN")
    printf "%s: %s\n" \
      "$type" \
      "$message"
    ;;
  "$BL64_MSG_FORMAT_HOST")
    printf "@%s %s: %s\n" \
      "$HOSTNAME" \
      "$type" \
      "$message"
    ;;
  "$BL64_MSG_FORMAT_TIME")
    printf "[%(%d/%b/%Y-%H:%M:%S)T] %s: %s\n" \
      '-1' \
      "$type" \
      "$message"
    ;;
  "$BL64_MSG_FORMAT_CALLER")
    printf "%s %s: %s\n" \
      "$BL64_SCRIPT_NAME" \
      "$type" \
      "$message"
    ;;
  "$BL64_MSG_FORMAT_FULL")
    printf "%s@%s[%(%d/%b/%Y-%H:%M:%S)T] %s: %s\n" \
      "$BL64_SCRIPT_NAME" \
      "$HOSTNAME" \
      '-1' \
      "$type" \
      "$message"
    ;;
  *)
    bl64_msg_show_error "$_BL64_MSG_TXT_INVALID_FORMAT"
    return $BL64_MSG_ERROR_INVALID_FORMAT
  esac

}

function bl64_msg_setup() {
  local format="$1"

  if [[
    "$format" != "$BL64_MSG_FORMAT_PLAIN" && \
    "$format" != "$BL64_MSG_FORMAT_HOST" && \
    "$format" != "$BL64_MSG_FORMAT_TIME" && \
    "$format" != "$BL64_MSG_FORMAT_CALLER" && \
    "$format" != "$BL64_MSG_FORMAT_FULL"
  ]]; then
    bl64_msg_show_error "$_BL64_MSG_TXT_INVALID_FORMAT"
    return $BL64_MSG_ERROR_INVALID_FORMAT
  fi

  BL64_MSG_FORMAT="$format"
}

function bl64_msg_show_usage() {

  local usage="${1:-$BL64_LIB_VAR_TBD}"
  local description="${2:-$BL64_LIB_VAR_NULL}"
  local commands="${3:-$BL64_LIB_VAR_NULL}"
  local flags="${4:-$BL64_LIB_VAR_NULL}"
  local parameters="${5:-$BL64_LIB_VAR_NULL}"

  printf '\n%s: %s %s\n\n' "$_BL64_MSG_TXT_USAGE" "$BL64_SCRIPT_NAME" "$usage"

  if [[ "$description" != "$BL64_LIB_VAR_NULL" ]]; then
    printf '%s\n\n' "$description"
  fi

  if [[ "$commands" != "$BL64_LIB_VAR_NULL" ]]; then
    printf '%s\n%s\n' "$_BL64_MSG_TXT_COMMANDS" "$commands"
  fi

  if [[ "$flags" != "$BL64_LIB_VAR_NULL" ]]; then
    printf '%s\n%s\n' "$_BL64_MSG_TXT_FLAGS" "$flags"
  fi

  if [[ "$parameters" != "$BL64_LIB_VAR_NULL" ]]; then
    printf '%s\n%s\n' "$_BL64_MSG_TXT_PARAMETERS" "$parameters"
  fi

  return 0

}

function bl64_msg_show_error() {

  local message="${1-$BL64_LIB_VAR_TBD}"

  _bl64_msg_show "$_BL64_MSG_TXT_ERROR" "$message" >&2

}

function bl64_msg_show_warning() {

  local message="${1-$BL64_LIB_VAR_TBD}"

  _bl64_msg_show "$_BL64_MSG_TXT_WARNING" "$message" >&2

}

function bl64_msg_show_info() {

  local message="${1-$BL64_LIB_VAR_TBD}"

  _bl64_msg_show "$_BL64_MSG_TXT_INFO" "$message"

}

function bl64_msg_show_task() {

  local message="${1-$BL64_LIB_VAR_TBD}"

  _bl64_msg_show "$_BL64_MSG_TXT_TASK" "$message"

}

function bl64_msg_show_debug() {

  local message="${1-$BL64_LIB_VAR_TBD}"

  _bl64_msg_show "$_BL64_MSG_TXT_DEBUG" "$message" >&2

}

function bl64_msg_show_text() {

  local message="${1-$BL64_LIB_VAR_TBD}"

  printf '%s\n' "$message"

  return 0

}

function bl64_os_get_distro() {

  BL64_OS_DISTRO='UNKNOWN'

  if [[ -r '/etc/os-release' ]]; then

    source '/etc/os-release'

    if [[ -n "$ID" && -n "$VERSION_ID" ]]; then
      BL64_OS_DISTRO="${ID^^}-${VERSION_ID}"
    fi

  fi

  return 0
}

function bl64_os_set_command() {
  if [[ "$BL64_OS_DISTRO" =~ (UBUNTU-.*|FEDORA-.*|CENTOS-.*|OL-.*|DEBIAN-.*) ]]; then
    BL64_OS_CMD_AWK='/usr/bin/awk'
    BL64_OS_CMD_ID='/usr/bin/id'
    BL64_OS_CMD_USERADD='/usr/sbin/useradd'
    BL64_OS_CMD_TAR='/bin/tar'
    BL64_OS_CMD_LN='/bin/ln'
  fi
  if [[ "$BL64_OS_DISTRO" =~ (UBUNTU-.*|DEBIAN-.*) ]]; then
    BL64_OS_CMD_CAT='/bin/cat'
    BL64_OS_CMD_CHMOD='/bin/chmod'
    BL64_OS_CMD_CHOWN='/bin/chown'
    BL64_OS_CMD_CP='/bin/cp'
    BL64_OS_CMD_DATE="/bin/date"
    BL64_OS_CMD_GREP='/bin/grep'
    BL64_OS_CMD_HOSTNAME='/bin/hostname'
    BL64_OS_CMD_LS='/bin/ls'
    BL64_OS_CMD_MKDIR='/bin/mkdir'
    BL64_OS_CMD_MKTEMP='/bin/mktemp'
    BL64_OS_CMD_MV='/bin/mv'
    BL64_OS_CMD_RM='/bin/rm'
  fi
  if [[ "$BL64_OS_DISTRO" =~ (FEDORA-.*|CENTOS-.*|OL-.*) ]]; then
    BL64_OS_CMD_CAT='/usr/bin/cat'
    BL64_OS_CMD_CHMOD='/usr/bin/chmod'
    BL64_OS_CMD_CHOWN='/usr/bin/chown'
    BL64_OS_CMD_CP='/usr/bin/cp'
    BL64_OS_CMD_DATE="/usr/bin/date"
    BL64_OS_CMD_GREP='/usr/bin/grep'
    BL64_OS_CMD_HOSTNAME='/usr/bin/hostname'
    BL64_OS_CMD_LS='/usr/bin/ls'
    BL64_OS_CMD_MKDIR='/usr/bin/mkdir'
    BL64_OS_CMD_MKTEMP='/usr/bin/mktemp'
    BL64_OS_CMD_MV='/usr/bin/mv'
    BL64_OS_CMD_RM='/usr/bin/rm'
  fi

  return 0
}

function bl64_os_set_alias() {

  BL64_OS_ALIAS_CHOWN_DIR="$BL64_OS_CMD_CHOWN --verbose --recursive"
  BL64_OS_ALIAS_CP_FILE="$BL64_OS_CMD_CP --verbose --force"
  BL64_OS_ALIAS_ID_USER="$BL64_OS_CMD_ID -u -n"
  BL64_OS_ALIAS_LN_SYMBOLIC="$BL64_OS_CMD_LN --verbose --symbolic"
  BL64_OS_ALIAS_LS_FILES="$BL64_OS_CMD_LS --color=never"
  BL64_OS_ALIAS_MKDIR_FULL="$BL64_OS_CMD_MKDIR --parents --verbose"
  BL64_OS_ALIAS_MV="$BL64_OS_CMD_MV --force --verbose"
  BL64_OS_ALIAS_RM_FILE="$BL64_OS_CMD_RM --verbose --force --one-file-system"
  BL64_OS_ALIAS_RM_FULL="$BL64_OS_CMD_RM --verbose --force --one-file-system --recursive"

}

function bl64_os_chown_dir() {
  $BL64_OS_ALIAS_CHOWN_DIR "$@"
}

function bl64_os_cp_file() {
  $BL64_OS_ALIAS_CP_FILE "$@"
}

function bl64_os_id_user() {
  $BL64_OS_ALIAS_ID_USER "$@"
}

function bl64_os_ln_symbolic() {
  $BL64_OS_ALIAS_LN_SYMBOLIC "$@"
}

function bl64_os_ls_files() {
  $BL64_OS_ALIAS_LS_FILES "$@"
}

function bl64_os_mkdir_full() {
  $BL64_OS_ALIAS_MKDIR_FULL "$@"
}

function bl64_os_mv() {
  $BL64_OS_ALIAS_MV "$@"
}

function bl64_os_rm_file() {
  $BL64_OS_ALIAS_RM_FILE "$@"
}

function bl64_os_rm_full() {
  $BL64_OS_ALIAS_RM_FULL "$@"
}



function bl64_os_cleanup_tmps() {

  $BL64_OS_ALIAS_RM_FULL -- /tmp/[[:alnum:]]*
  $BL64_OS_ALIAS_RM_FULL -- /var/tmp/[[:alnum:]]*
  :

}

function bl64_os_cleanup_logs() {

  if [[ -d /var/log ]]; then
    $BL64_OS_ALIAS_RM_FULL /var/log/[[:alpha:]]*
  fi
  :

}

function bl64_os_cleanup_caches() {

  if [[ -d /var/cache/man ]]; then
    $BL64_OS_ALIAS_RM_FULL /var/cache/man/[[:alpha:]]*
  fi
  :

}

function bl64_os_cleanup_full() {

  bl64_pkg_cleanup
  bl64_os_cleanup_tmps
  bl64_os_cleanup_logs
  bl64_os_cleanup_caches
  :

}

function bl64_pkg_deploy() {

  bl64_pkg_prepare && \
  bl64_pkg_install "$@" && \
  bl64_pkg_cleanup

}

function bl64_pkg_prepare() {

  export LC_ALL="C"

  case "$BL64_OS_DISTRO" in
  UBUNTU-* | DEBIAN-*)
    export DEBIAN_FRONTEND="noninteractive"
    $BL64_PKG_ALIAS_APT_UPDATE
    ;;
  FEDORA-* | CENTOS-* | OL-*)
    $BL64_PKG_ALIAS_DNF_CACHE
    ;;
  esac

}

function bl64_pkg_install() {

  export LC_ALL="C"

  case "$BL64_OS_DISTRO" in
  UBUNTU-* | DEBIAN-*)
    export DEBIAN_FRONTEND="noninteractive"
    $BL64_PKG_ALIAS_APT_INSTALL -- "$@"
    ;;
  FEDORA-* | CENTOS-* | OL-*)
    $BL64_PKG_ALIAS_DNF_INSTALL -- "$@"
    ;;
  esac

}

function bl64_pkg_cleanup() {

  export LC_ALL="C"

  case "$BL64_OS_DISTRO" in
  UBUNTU-* | DEBIAN-*)
    export DEBIAN_FRONTEND="noninteractive"
    $BL64_PKG_ALIAS_APT_CLEAN
    ;;
  FEDORA-* | CENTOS-* | OL-*)
    $BL64_PKG_ALIAS_DNF_CLEAN
    ;;
  esac

}

function bl64_sudo_add_root() {
  local user="$1"
  local status=$BL64_SUDO_ERROR_UPDATE_FAILED
  local new_sudoers="${BL64_SUDO_FILE_SUDOERS}.bl64_new"
  local old_sudoers="${BL64_SUDO_FILE_SUDOERS}.bl64_old"

  if [[ -z "$user" ]]; then
    bl64_msg_show_error "$_BL64_SUDO_TXT_MISSING_PARAMETER (user)"
    return $BL64_SUDO_ERROR_MISSING_PARAMETER
  fi

  bl64_check_command "$BL64_OS_CMD_AWK" || return $BL64_SUDO_ERROR_MISSING_AWK
  bl64_check_file "$BL64_SUDO_FILE_SUDOERS" || return $BL64_SUDO_ERROR_MISSING_SUDOERS
  bl64_sudo_check_sudoers "$BL64_SUDO_FILE_SUDOERS" || return $BL64_SUDO_ERROR_INVALID_SUDOERS

  umask 0266
  "$BL64_OS_CMD_AWK" -v ControlUsr="$user" '
    BEGIN { Found = 0 }
    ControlUsr " ALL=(ALL) NOPASSWD: ALL" == $0 { Found = 1 }
    { print $0 }
    END {
      if( Found == 0) {
      print( ControlUsr " ALL=(ALL) NOPASSWD: ALL" )
    }
  }' "$BL64_SUDO_FILE_SUDOERS" > "$new_sudoers"

  if [[ -s "$new_sudoers" ]]; then
    $BL64_OS_ALIAS_CP_FILE "${BL64_SUDO_FILE_SUDOERS}" "$old_sudoers"
  fi
  if [[ -s "$new_sudoers" && -s "$old_sudoers" ]]; then
    "$BL64_OS_CMD_CAT" "${BL64_SUDO_FILE_SUDOERS}.bl64_new" > "${BL64_SUDO_FILE_SUDOERS}" && \
    bl64_sudo_check_sudoers "$BL64_SUDO_FILE_SUDOERS"
    status=$?
  fi

  return $status
}

function bl64_sudo_check_sudoers() {
  local sudoers="$1"
  local status=0

  bl64_check_command "$BL64_SUDO_CMD_VISUDO" || return $BL64_SUDO_ERROR_MISSING_VISUDO

  "$BL64_SUDO_CMD_VISUDO" \
    --check \
    --file "$sudoers"
  status=$?

  if (( status != 0 )); then
    bl64_msg_show_error "$_BL64_SUDO_TXT_INVALID_SUDOERS ($sudoers)"
  fi

  return $status
}

function bl64_sudo_set_alias() {

  BL64_SUDO_ALIAS_SUDO_ENV="$BL64_SUDO_CMD_SUDO --preserve-env --set-home"

}

function bl64_vcs_git_clone() {
  local source="${1}"
  local destination="${2}"
  local branch="${3:-main}"

  bl64_check_parameter 'source' 'repository source' || return $BL64_VCS_ERROR_MISSING_PARAMETER
  bl64_check_parameter 'destination' 'repository destination' || return $BL64_VCS_ERROR_MISSING_PARAMETER

  [[ ! -d "$destination" ]] && bl64_os_mkdir_full "$destination"
  bl64_check_directory "$destination" || return $BL64_VCS_ERROR_DESTINATION_ERROR

  cd "$destination" || return $BL64_VCS_ERROR_DESTINATION_ERROR

  "$BL64_VCS_CMD_GIT" \
    clone \
    --depth 1 \
    --single-branch \
    --branch "$branch" \
    "$source"

}

export LANG
export LC_ALL
export LANGUAGE

export BL64_LIB_CMD="${BL64_LIB_CMD:-0}"
export BL64_LIB_DEBUG="${BL64_LIB_DEBUG:-0}"
export BL64_LIB_STRICT="${BL64_LIB_STRICT:-1}"
export BL64_LIB_LANG="${BL64_LIB_LANG:-1}"

export BL64_LIB_SIGNAL_HUP="${BL64_LIB_SIGNAL_HUP:--}"
export BL64_LIB_SIGNAL_STOP="${BL64_LIB_SIGNAL_STOP:--}"
export BL64_LIB_SIGNAL_QUIT="${BL64_LIB_SIGNAL_QUIT:--}"

export BL64_SCRIPT_NAME="${BL64_SCRIPT_NAME:-${0##*/}}"

export BL64_SCRIPT_SID="${BASHPID}"

readonly BL64_LIB_VAR_NULL='__s64__'
readonly BL64_LIB_VAR_TBD='TBD'


set -o pipefail

if [[ "$BL64_LIB_STRICT" == '1' ]]; then
  unset -f unalias
  \unalias -a
  unset -f command
  unset MAIL
  unset ENV
  unset IFS
  set -u
  set -p
fi

trap "$BL64_LIB_SIGNAL_HUP" 'SIGHUP'
trap "$BL64_LIB_SIGNAL_STOP" 'SIGINT'
trap "$BL64_LIB_SIGNAL_QUIT" 'SIGQUIT'
trap "$BL64_LIB_SIGNAL_QUIT" 'SIGTERM'

export TERM="${TERM:-vt100}"

bl64_os_get_distro

case "$BL64_OS_DISTRO" in
UBUNTU-* | FEDORA-* | CENTOS-* | OL-* | DEBIAN-*)
  if [[ "$BL64_LIB_LANG" == '1' ]]; then
    LANG='C'
    LC_ALL='C'
    LANGUAGE='C'
  fi
  ;;
*)
  printf '%s\n' "Fatal: BashLib64 is not supported in the current OS" >&2
  exit 1
  ;;
esac

bl64_os_set_command
bl64_os_set_alias
bl64_sudo_set_alias

if [[ "$BL64_LIB_CMD" = '1' ]]; then
  "$@"
else
  :
fi
