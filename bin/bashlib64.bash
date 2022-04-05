#!/bin/bash
#######################################
# BashLib64
#
# Author: serdigital64 (https://github.com/serdigital64)
# License: GPL-3.0-or-later (https://www.gnu.org/licenses/gpl-3.0.txt)
# Repository: https://github.com/serdigital64/bashlib64
# Version: 1.21.0
#######################################

# Enable library and app tracing
[[ "$BL64_LIB_DEBUG" == '1' ]] && set -x

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

readonly BL64_CHECK_ERROR_EXPORT_EMPTY=8
readonly BL64_CHECK_ERROR_EXPORT_SET=9


readonly _BL64_CHECK_TXT_MISSING_PARAMETER='required parameter is missing'

readonly _BL64_CHECK_TXT_COMMAND_NOT_FOUND='required command is not present'
readonly _BL64_CHECK_TXT_COMMAND_NOT_EXECUTABLE='required command is present but has no execution permission'

readonly _BL64_CHECK_TXT_FILE_NOT_FOUND='required file is not present'
readonly _BL64_CHECK_TXT_FILE_NOT_READABLE='required file is present but has no read permission'

readonly _BL64_CHECK_TXT_DIRECTORY_NOT_FOUND='required directory is not present'
readonly _BL64_CHECK_TXT_DIRECTORY_NOT_READABLE='required directory is present but has no read permission'

readonly _BL64_CHECK_TXT_EXPORT_EMPTY='required shell exported variable is empty'
readonly _BL64_CHECK_TXT_EXPORT_SET='required shell exported variable is not set'


readonly BL64_DBG_TARGET_NONE='0'
readonly BL64_DBG_TARGET_CMD='1'
readonly BL64_DBG_TARGET_ALL_TRACE='2'
readonly BL64_DBG_TARGET_APP_TRACE='3'
readonly BL64_DBG_TARGET_APP_TASK='4'
readonly BL64_DBG_TARGET_LIB_TRACE='5'
readonly BL64_DBG_TARGET_LIB_TASK='6'

export BL64_IAM_CMD_USERADD

export BL64_IAM_ALIAS_USERADD

readonly BL64_IAM_ERROR_MISSING_PARAMETER=200
readonly BL64_IAM_ERROR_MISSING_USER_ADD=201

readonly _BL64_IAM_TXT_MISSING_PARAMETER='required parameter is missing'

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
readonly _BL64_MSG_TXT_BATCH='Process'
readonly _BL64_MSG_TXT_INVALID_FORMAT='invalid format. Please use one of BL64_MSG_FORMAT_*'
readonly _BL64_MSG_TXT_BATCH_START='start executing command'
readonly _BL64_MSG_TXT_BATCH_FINISH_OK='command executed successfully'
readonly _BL64_MSG_TXT_BATCH_FINISH_ERROR='command executed with errors'

export BL64_MSG_FORMAT="${BL64_MSG_FORMAT:-$BL64_MSG_FORMAT_FULL}"

export BL64_OS_DISTRO

export BL64_OS_CMD_AWK
export BL64_OS_CMD_CAT
export BL64_OS_CMD_CAT
export BL64_OS_CMD_CHMOD
export BL64_OS_CMD_CHOWN
export BL64_OS_CMD_CP
export BL64_OS_CMD_DATE
export BL64_OS_CMD_FALSE
export BL64_OS_CMD_GAWK
export BL64_OS_CMD_GREP
export BL64_OS_CMD_HOSTNAME
export BL64_OS_CMD_ID
export BL64_OS_CMD_LN
export BL64_OS_CMD_LS
export BL64_OS_CMD_MKDIR
export BL64_OS_CMD_MKTEMP
export BL64_OS_CMD_MV
export BL64_OS_CMD_RM
export BL64_OS_CMD_TAR
export BL64_OS_CMD_TRUE
export BL64_OS_CMD_UNAME

export BL64_OS_ALIAS_AWK
export BL64_OS_ALIAS_CHOWN_DIR
export BL64_OS_ALIAS_CP_FILE
export BL64_OS_ALIAS_ID_USER
export BL64_OS_ALIAS_LN_SYMBOLIC
export BL64_OS_ALIAS_LS_FILES
export BL64_OS_ALIAS_MKDIR_FULL
export BL64_OS_ALIAS_MV
export BL64_OS_ALIAS_RM_FILE
export BL64_OS_ALIAS_RM_FULL

readonly BL64_OS_TAGS='ALM ALP AMZ CNT DEB FD MCOS OL RHEL UB'; export BL64_OS_TAGS

readonly BL64_OS_ALM='ALMALINUX'; export BL64_OS_ALM
readonly BL64_OS_ALP='ALPINE'; export BL64_OS_ALP
readonly BL64_OS_AMZ='AMZN'; export BL64_OS_AMZ
readonly BL64_OS_CNT='CENTOS'; export BL64_OS_CNT
readonly BL64_OS_DEB='DEBIAN'; export BL64_OS_DEB
readonly BL64_OS_FD='FEDORA'; export BL64_OS_FD
readonly BL64_OS_MCOS='DARWIN'; export BL64_OS_MCOS
readonly BL64_OS_OL='OL'; export BL64_OS_OL
readonly BL64_OS_RHEL='RHEL'; export BL64_OS_RHEL
readonly BL64_OS_UB='UBUNTU'; export BL64_OS_UB
readonly BL64_OS_UNK='UNKNOWN'; export BL64_OS_UNK

readonly BL64_OS_ERROR_NO_OS_MATCH=200
readonly BL64_OS_ERROR_INVALID_OS_TAG=201
readonly BL64_OS_ERROR_UNKNOWN_OS=202

export BL64_PKG_CMD_APT
export BL64_PKG_CMD_DNF
export BL64_PKG_CMD_YUM
export BL64_PKG_CMD_APK
export BL64_PKG_CMD_BRW

export BL64_PKG_ALIAS_APT_UPDATE
export BL64_PKG_ALIAS_APT_INSTALL
export BL64_PKG_ALIAS_APT_CLEAN
export BL64_PKG_ALIAS_DNF_CACHE
export BL64_PKG_ALIAS_DNF_INSTALL
export BL64_PKG_ALIAS_DNF_CLEAN
export BL64_PKG_ALIAS_YUM_CACHE
export BL64_PKG_ALIAS_YUM_INSTALL
export BL64_PKG_ALIAS_YUM_CLEAN
export BL64_PKG_ALIAS_APK_INSTALL
export BL64_PKG_ALIAS_APK_UPDATE
export BL64_PKG_ALIAS_BRW_INSTALL
export BL64_PKG_ALIAS_BRW_CLEAN

readonly BL64_RND_LENGTH_1=1
readonly BL64_RND_LENGTH_20=20
readonly BL64_RND_LENGTH_100=100
readonly BL64_RND_RANDOM_MIN=0
readonly BL64_RND_RANDOM_MAX=32767

readonly BL64_RND_POOL_UPPERCASE="$(printf '%b' $(printf '\\%o' {65..90}))"
readonly BL64_RND_POOL_UPPERCASE_MAX_IDX="$(( ${#BL64_RND_POOL_UPPERCASE} - 1 ))"
readonly BL64_RND_POOL_LOWERCASE="$(printf '%b' $(printf '\\%o' {97..122}))"
readonly BL64_RND_POOL_LOWERCASE_MAX_IDX="$(( ${#BL64_RND_POOL_LOWERCASE} - 1 ))"
readonly BL64_RND_POOL_DIGITS="$(printf '%b' $(printf '\\%o' {48..57}))"
readonly BL64_RND_POOL_DIGITS_MAX_IDX="$(( ${#BL64_RND_POOL_DIGITS} - 1 ))"
readonly BL64_RND_POOL_ALPHANUMERIC="${BL64_RND_POOL_UPPERCASE}${BL64_RND_POOL_LOWERCASE}${BL64_RND_POOL_DIGITS}"
readonly BL64_RND_POOL_ALPHANUMERIC_MAX_IDX="$(( ${#BL64_RND_POOL_ALPHANUMERIC} - 1 ))"

readonly BL64_RND_ERROR_MIN=1
readonly BL64_RND_ERROR_MAX=2

readonly _BL64_RND_TXT_LENGHT_MIN='length can not be less than'
readonly _BL64_RND_TXT_LENGHT_MAX='length can not be greater than'

export BL64_RXTX_CMD_CURL
export BL64_RXTX_CMD_WGET

export BL64_RXTX_ALIAS_CURL
export BL64_RXTX_ALIAS_WGET

export BL64_RXTX_SET_CURL_VERBOSE
export BL64_RXTX_SET_WGET_VERBOSE
export BL64_RXTX_SET_CURL_OUTPUT
export BL64_RXTX_SET_WGET_OUTPUT

readonly BL64_RXTX_ERROR_BACKUP=197
readonly BL64_RXTX_ERROR_RESTORE=198
readonly BL64_RXTX_ERROR_TEMPORARY_REPO=199
readonly BL64_RXTX_ERROR_MISSING_PARAMETER=200
readonly BL64_RXTX_ERROR_MISSING_COMMAND=201

readonly _BL64_RXTX_TXT_MISSING_PARAMETER='required parameter is missing'
readonly _BL64_RXTX_TXT_MISSING_COMMAND='no web transfer command was found on the system'

readonly _BL64_RXTX_BACKUP_POSTFIX='._bl64_rxtx_backup'

export BL64_SUDO_CMD_SUDO
export BL64_SUDO_CMD_VISUDO
export BL64_SUDO_FILE_SUDOERS

readonly BL64_SUDO_ERROR_MISSING_PARAMETER=200
readonly BL64_SUDO_ERROR_MISSING_AWK=201
readonly BL64_SUDO_ERROR_MISSING_SUDOERS=202
readonly BL64_SUDO_ERROR_MISSING_VISUDO=203
readonly BL64_SUDO_ERROR_UPDATE_FAILED=210
readonly BL64_SUDO_ERROR_INVALID_SUDOERS=211

readonly _BL64_SUDO_TXT_MISSING_PARAMETER='required parameter is missing'
readonly _BL64_SUDO_TXT_INVALID_SUDOERS='the sudoers file is corrupt or invalid'

export BL64_SUDO_ALIAS_SUDO_ENV

export BL64_VCS_CMD_GIT

export BL64_VCS_ALIAS_GIT

readonly BL64_VCS_ERROR_MISSING_PARAMETER=200
readonly BL64_VCS_ERROR_DESTINATION_ERROR=201
readonly BL64_VCS_ERROR_MISSING_COMMAND=202

readonly BL64_XSV_ERROR_SEARCH_VALUES=199
readonly BL64_XSV_ERROR_MISSING_PARAMETER=200
readonly BL64_XSV_ERROR_MISSING_COMMAND=201

readonly BL64_XSV_FS='_@64@_'       # Custom
readonly BL64_XSV_FS_SPACE=' '
readonly BL64_XSV_FS_TAB='	'
readonly BL64_XSV_FS_COLON=':'
readonly BL64_XSV_FS_SEMICOLON=';'
readonly BL64_XSV_FS_COMMA=','
readonly BL64_XSV_FS_PIPE='|'
readonly BL64_XSV_FS_AT='@'
readonly BL64_XSV_FS_DOLLAR='$'
readonly BL64_XSV_FS_SLASH='/'

export BL64_XSV_FS
export BL64_XSV_FS_SPACE
export BL64_XSV_FS_TAB
export BL64_XSV_FS_COLON
export BL64_XSV_FS_SEMICOLON
export BL64_XSV_FS_COMMA
export BL64_XSV_FS_PIPE
export BL64_XSV_FS_AT
export BL64_XSV_FS_DOLLAR
export BL64_XSV_FS_SLASH

readonly _BL64_XSV_TXT_SOURCE_NOT_FOUND='source file not found'

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

  case "$BL64_OS_DISTRO" in
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-* | ${BL64_OS_FD}-* | ${BL64_OS_CNT}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* | ${BL64_OS_OL}-*)
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
    ;;
  ${BL64_OS_ALP}-*)
    "$BL64_OS_CMD_TAR" \
      x \
      --overwrite \
      -f "$source" \
      -o \
      -v
    status=$?
    ;;
  ${BL64_OS_MCOS}-*)
    "$BL64_OS_CMD_TAR" \
      --extract \
      --no-same-owner \
      --preserve-permissions \
      --no-acls \
      --verbose \
      --auto-compress \
      --file="$source"
    status=$?
    ;;
  esac

  ((status == 0)) && $BL64_OS_ALIAS_RM_FILE "$source"

  return $status
}

function bl64_check_command() {
  local path="$1"
  local message="${2:-$_BL64_CHECK_TXT_COMMAND_NOT_FOUND}"

  if [[ -z "$path" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_MISSING_PARAMETER (command path)"
    return $BL64_CHECK_ERROR_MISSING_PARAMETER
  fi
  if [[ ! -f "$path" ]]; then
    bl64_msg_show_error "${message} (${path})"
    return $BL64_CHECK_ERROR_FILE_NOT_FOUND
  fi
  if [[ ! -x "$path" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_COMMAND_NOT_EXECUTABLE (${path})"
    return $BL64_CHECK_ERROR_FILE_NOT_EXECUTE
  fi
  :
}

function bl64_check_file() {
  local path="$1"
  local message="${2:-$_BL64_CHECK_TXT_FILE_NOT_FOUND}"

  if [[ -z "$path" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_MISSING_PARAMETER (file path)"
    return $BL64_CHECK_ERROR_MISSING_PARAMETER
  fi
  if [[ ! -f "$path" ]]; then
    bl64_msg_show_error "${message} (${path})"
    return $BL64_CHECK_ERROR_FILE_NOT_FOUND
  fi
  if [[ ! -r "$path" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_FILE_NOT_READABLE (${path})"
    return $BL64_CHECK_ERROR_FILE_NOT_READ
  fi
  :
}

function bl64_check_directory() {
  local path="$1"
  local message="${2:-$_BL64_CHECK_TXT_DIRECTORY_NOT_FOUND}"

  if [[ -z "$path" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_MISSING_PARAMETER (directory path)"
    return $BL64_CHECK_ERROR_MISSING_PARAMETER
  fi
  if [[ ! -d "$path" ]]; then
    bl64_msg_show_error "${message} (${path})"
    return $BL64_CHECK_ERROR_DIRECTORY_NOT_FOUND
  fi
  if [[ ! -r "$path" || ! -x "$path" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_DIRECTORY_NOT_READABLE (${path})"
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

  if eval "[[ -z \"\$${parameter}\" || \"\$${parameter}\" == '${BL64_LIB_VAR_TBD}' ]]"; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_MISSING_PARAMETER (${description})"
    return $BL64_CHECK_ERROR_PARAMETER_EMPTY
  fi
  :
}

function bl64_check_export() {
  local export_name="$1"
  local description="${2:-export_name $export_name}"

  if [[ -z "$export_name" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_MISSING_PARAMETER (export name)"
    return $BL64_CHECK_ERROR_MISSING_PARAMETER
  fi

  if [[ ! -v "$export_name" ]]; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_EXPORT_SET (${description})"
    return $BL64_CHECK_ERROR_EXPORT_SET
  fi

  if eval "[[ -z \$${export_name} ]]"; then
    bl64_msg_show_error "$_BL64_CHECK_TXT_EXPORT_EMPTY (${description})"
    return $BL64_CHECK_ERROR_EXPORT_EMPTY
  fi
  :
}

function bl64_dbg_app_trace_stop() {
  set +x
}

function bl64_dbg_app_trace_start() {
  set +x

  [[ "$BL64_LIB_DEBUG" == "$BL64_DBG_TARGET_APP_TRACE" || "$BL64_LIB_DEBUG" == "$BL64_DBG_TARGET_ALL_TRACE" ]] && set -x

  return 0
}

function bl64_dbg_lib_trace_stop() {
  set +x
}

function bl64_dbg_lib_trace_start() {
  set +x

  [[ "$BL64_LIB_DEBUG" == "$BL64_DBG_TARGET_LIB_TRACE" || "$BL64_LIB_DEBUG" == "$BL64_DBG_TARGET_ALL_TRACE" ]] && set -x

  return 0
}

function bl64_dbg_lib_show() {
  local message="$1"

  [[ "$BL64_LIB_DEBUG" != "$BL64_DBG_TARGET_LIB_TASK" ]] && return 0
  bl64_msg_show_debug "[${FUNCNAME[1]}] $message"

  return 0
}

function bl64_dbg_app_show() {
  local message="$1"

  [[ "$BL64_LIB_DEBUG" != "$BL64_DBG_TARGET_APP_TASK" ]] && return 0
  bl64_msg_show_debug "[${FUNCNAME[1]}] $message"

  return 0
}

function bl64_fmt_strip_comments() {
  local source="${1:--}"

  "$BL64_OS_CMD_GREP" -v -E '^#.*$|^ *#.*$' "$source"
}

function bl64_fmt_strip_starting_slash() {
  local path="$1"

  if [[ -z "$path" ]]; then
    return $BL64_LIB_VAR_OK
  elif [[ "$path" == '/' ]]; then
    printf '%s' "${path}"
  elif [[ "$path" == /* ]]; then
    printf '%s' "${path:1}"
  else
    printf '%s' "${path}"
  fi
}

function bl64_fmt_strip_ending_slash() {
  local path="$1"

  if [[ -z "$path" ]]; then
    return $BL64_LIB_VAR_OK
  elif [[ "$path" == '/' ]]; then
    printf '%s' "${path}"
  elif [[ "$path" == */ ]]; then
    printf '%s' "${path:0:-1}"
  else
    printf '%s' "${path}"
  fi
}

function bl64_fmt_basename() {
  local path="$1"

  if [[ -z "$path" ]]; then
    return $BL64_LIB_VAR_OK
  elif [[ "$path" == '/' ]]; then
    return $BL64_LIB_VAR_OK
  else
    printf '%s' "${path##*/}"
  fi
}

function bl64_fmt_dirname() {
  local path="$1"

  if [[ -z "$path" ]]; then
    return $BL64_LIB_VAR_OK
  elif [[ "$path" == '/' ]]; then
    printf '%s' "${path}"
  elif [[ "$path" != */* ]]; then
    printf '%s' "${path}"
  elif [[ "$path" == /*/* ]]; then
    printf '%s' "${path%/*}"
  elif [[ "$path" == */*/* ]]; then
    printf '%s' "${path%/*}"
  elif [[ "$path" == /* && "${path:1}" != */* ]]; then
    printf '%s' '/'
  fi
}

function bl64_iam_set_command() {
  case "$BL64_OS_DISTRO" in
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-* | ${BL64_OS_FD}-* | ${BL64_OS_CNT}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* | ${BL64_OS_OL}-*)
    BL64_IAM_CMD_USERADD='/usr/sbin/useradd'
    ;;
  ${BL64_OS_ALP}-*)
    BL64_IAM_CMD_USERADD='/usr/sbin/adduser'
    ;;
  ${BL64_OS_MCOS}-*)
    BL64_IAM_CMD_USERADD='/usr/bin/dscl'
    ;;
  esac
}

function bl64_iam_set_alias() {
  case "$BL64_OS_DISTRO" in
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-* | ${BL64_OS_FD}-* | ${BL64_OS_CNT}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* | ${BL64_OS_OL}-*)
    BL64_IAM_ALIAS_USERADD="$BL64_IAM_CMD_USERADD"
    ;;
  ${BL64_OS_ALP}-*)
    BL64_IAM_ALIAS_USERADD="$BL64_IAM_CMD_USERADD"
    ;;
  ${BL64_OS_MCOS}-*)
    BL64_IAM_ALIAS_USERADD="$BL64_IAM_CMD_USERADD -q . -create"
    ;;
  esac
}

function bl64_iam_user_add() {
  local login="$1"

  if [[ -z "$login" ]]; then
    bl64_msg_show_error "$_BL64_IAM_TXT_MISSING_PARAMETER (login)"
    return $BL64_IAM_ERROR_MISSING_PARAMETER
  fi

  case "$BL64_OS_DISTRO" in
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-* | ${BL64_OS_FD}-* | ${BL64_OS_CNT}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* | ${BL64_OS_OL}-*)
    $BL64_IAM_ALIAS_USERADD "$login"
    ;;
  ${BL64_OS_ALP}-*)
    $BL64_IAM_ALIAS_USERADD -D "$login"
    ;;
  ${BL64_OS_MCOS}-*)
    $BL64_IAM_ALIAS_USERADD "/Users/${login}"
    ;;
  esac
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
    return $BL64_LOG_ERROR_INVALID_TYPE
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
  local description="${2:-$BL64_LIB_VAR_TBD}"
  local commands="${3:-$BL64_LIB_VAR_TBD}"
  local flags="${4:-$BL64_LIB_VAR_TBD}"
  local parameters="${5:-$BL64_LIB_VAR_TBD}"

  printf '\n%s: %s %s\n\n' "$_BL64_MSG_TXT_USAGE" "$BL64_SCRIPT_NAME" "$usage"

  if [[ "$description" != "$BL64_LIB_VAR_TBD" ]]; then
    printf '%s\n\n' "$description"
  fi

  if [[ "$commands" != "$BL64_LIB_VAR_TBD" ]]; then
    printf '%s\n%s\n' "$_BL64_MSG_TXT_COMMANDS" "$commands"
  fi

  if [[ "$flags" != "$BL64_LIB_VAR_TBD" ]]; then
    printf '%s\n%s\n' "$_BL64_MSG_TXT_FLAGS" "$flags"
  fi

  if [[ "$parameters" != "$BL64_LIB_VAR_TBD" ]]; then
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

  [[ "$BL64_LIB_VERBOSE" == "$BL64_LIB_VAR_OFF" ]] && return 0

  _bl64_msg_show "$_BL64_MSG_TXT_INFO" "$message"
}

function bl64_msg_show_task() {
  local message="${1-$BL64_LIB_VAR_TBD}"

  [[ "$BL64_LIB_VERBOSE" == "$BL64_LIB_VAR_OFF" ]] && return 0

  _bl64_msg_show "$_BL64_MSG_TXT_TASK" "$message"
}

function bl64_msg_show_debug() {
  local message="${1-$BL64_LIB_VAR_TBD}"

  _bl64_msg_show "$_BL64_MSG_TXT_DEBUG" "$message" >&2
}

function bl64_msg_show_text() {
  local message="${1-$BL64_LIB_VAR_TBD}"

  [[ "$BL64_LIB_VERBOSE" == "$BL64_LIB_VAR_OFF" ]] && return 0

  printf '%s\n' "$message"
}

function bl64_msg_show_batch_start() {
  local message="${1-$BL64_LIB_VAR_TBD}"

  [[ "$BL64_LIB_VERBOSE" == "$BL64_LIB_VAR_OFF" ]] && return 0

  _bl64_msg_show "$_BL64_MSG_TXT_BATCH" "[${message}] ${_BL64_MSG_TXT_BATCH_START}"
}

function bl64_msg_show_batch_finish() {
  local status="$1"
  local message="${2-$BL64_LIB_VAR_TBD}"

  [[ "$BL64_LIB_VERBOSE" == "$BL64_LIB_VAR_OFF" ]] && return 0

  if ((status == 0)); then
    _bl64_msg_show "$_BL64_MSG_TXT_BATCH" "[${message}] ${_BL64_MSG_TXT_BATCH_FINISH_OK}"
  else
    _bl64_msg_show "$_BL64_MSG_TXT_BATCH" "[${message}] ${_BL64_MSG_TXT_BATCH_FINISH_ERROR}: exit-status-${status}"
  fi
}


function _bl64_os_match() {

  local os="$1"
  local item="$2"
  local version="${item##*-}"

  if [[ "$item" == +([[:alpha:]])-+([[:digit:]]).+([[:digit:]]) ]]; then
    [[ "$BL64_OS_DISTRO" == "${os}-${version}" ]]
  elif [[ "$item" == +([[:alpha:]])-+([[:digit:]]) ]]; then
    [[ "$BL64_OS_DISTRO" == ${os}-${version}.+([[:digit:]]) ]]
  else
    [[ "$BL64_OS_DISTRO" == ${os}-+([[:digit:]]).+([[:digit:]]) ]]
  fi
}


function bl64_os_match() {
  local item=''

  bl64_dbg_lib_show "[OSList=${*}}] / [BL64_OS_DISTRO=${BL64_OS_DISTRO}]"
  for item in "$@"; do
    case "$item" in
    'ALM' | ALM-*) _bl64_os_match "$BL64_OS_ALM" "$item" && return 0 ;;
    'ALP' | ALP-*) _bl64_os_match "$BL64_OS_ALP" "$item" && return 0 ;;
    'CNT' | CNT-*) _bl64_os_match "$BL64_OS_CNT" "$item" && return 0 ;;
    'DEB' | DEB-*) _bl64_os_match "$BL64_OS_DEB" "$item" && return 0 ;;
    'FD' | FD-*) _bl64_os_match "$BL64_OS_FD" "$item" && return 0 ;;
    'MCOS' | MCOS-*) _bl64_os_match "$BL64_OS_MCOS" "$item" && return 0 ;;
    'OL' | OL-*) _bl64_os_match "$BL64_OS_OL" "$item" && return 0 ;;
    'RHEL' | RHEL-*) _bl64_os_match "$BL64_OS_RHEL" "$item" && return 0 ;;
    'UB' | UB-*) _bl64_os_match "$BL64_OS_UB" "$item" && return 0 ;;
    *) return $BL64_OS_ERROR_INVALID_OS_TAG ;;
    esac
  done

  return $BL64_OS_ERROR_NO_OS_MATCH
}

function bl64_os_get_distro() {
  if [[ -r '/etc/os-release' ]]; then
    _bl64_os_get_distro_from_os_release
  else
    _bl64_os_get_distro_from_uname
  fi

}

function _bl64_os_get_distro_from_uname() {
  local os_type=''
  local os_version=''
  local cmd_sw_vers='/usr/bin/sw_vers'

  os_type="$(uname)"
  case "$os_type" in
  'Darwin')
    os_version="$("$cmd_sw_vers" -productVersion)"
    BL64_OS_DISTRO="DARWIN-${os_version}"
    ;;
  *) BL64_OS_DISTRO='UNKNOWN' ;;
  esac
}

function _bl64_os_get_distro_from_os_release() {
  source '/etc/os-release'
  if [[ -n "$ID" && -n "$VERSION_ID" ]]; then
    BL64_OS_DISTRO="${ID^^}-${VERSION_ID}"
  fi

  case "$BL64_OS_DISTRO" in
  ${BL64_OS_ALM}-8*) : ;;
  ${BL64_OS_ALP}-3*) : ;;
  ${BL64_OS_CNT}-7* | ${BL64_OS_CNT}-8* | ${BL64_OS_CNT}-9*) : ;;
  ${BL64_OS_DEB}-9*)
    [[ "$BL64_OS_DISTRO" == "${BL64_OS_DEB}-9" ]] && BL64_OS_DISTRO="${BL64_OS_DEB}-9.0"
    ;;
  ${BL64_OS_DEB}-10*)
    [[ "$BL64_OS_DISTRO" == "${BL64_OS_DEB}-10" ]] && BL64_OS_DISTRO="${BL64_OS_DEB}-10.0"
    ;;
  ${BL64_OS_DEB}-11*)
    [[ "$BL64_OS_DISTRO" == "${BL64_OS_DEB}-11" ]] && BL64_OS_DISTRO="${BL64_OS_DEB}-11.0"
    ;;
  ${BL64_OS_FD}-33* | ${BL64_OS_FD}-34* | ${BL64_OS_FD}-35*) : ;;
  ${BL64_OS_OL}-7* | ${BL64_OS_OL}-8*) : ;;
  ${BL64_OS_RHEL}-8*) : ;;
  ${BL64_OS_UB}-20* | ${BL64_OS_UB}-21*) : ;;
  *) BL64_OS_DISTRO='UNKNOWN' ;;
  esac
}

function bl64_os_set_command() {
  case "$BL64_OS_DISTRO" in
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-*)
    BL64_OS_CMD_AWK='/usr/bin/awk'
    BL64_OS_CMD_CAT='/bin/cat'
    BL64_OS_CMD_CHMOD='/bin/chmod'
    BL64_OS_CMD_CHOWN='/bin/chown'
    BL64_OS_CMD_CP='/bin/cp'
    BL64_OS_CMD_DATE="/bin/date"
    BL64_OS_CMD_FALSE="/bin/false"
    BL64_OS_CMD_GAWK='/usr/bin/gawk'
    BL64_OS_CMD_GREP='/bin/grep'
    BL64_OS_CMD_HOSTNAME='/bin/hostname'
    BL64_OS_CMD_ID='/usr/bin/id'
    BL64_OS_CMD_LN='/bin/ln'
    BL64_OS_CMD_LS='/bin/ls'
    BL64_OS_CMD_MKDIR='/bin/mkdir'
    BL64_OS_CMD_MKTEMP='/bin/mktemp'
    BL64_OS_CMD_MV='/bin/mv'
    BL64_OS_CMD_RM='/bin/rm'
    BL64_OS_CMD_TAR='/bin/tar'
    BL64_OS_CMD_TRUE="/bin/true"
    BL64_OS_CMD_UNAME='/bin/uname'
    ;;
  ${BL64_OS_FD}-* | ${BL64_OS_CNT}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* | ${BL64_OS_OL}-*)
    BL64_OS_CMD_AWK='/usr/bin/awk'
    BL64_OS_CMD_CAT='/usr/bin/cat'
    BL64_OS_CMD_CHMOD='/usr/bin/chmod'
    BL64_OS_CMD_CHOWN='/usr/bin/chown'
    BL64_OS_CMD_CP='/usr/bin/cp'
    BL64_OS_CMD_DATE="/usr/bin/date"
    BL64_OS_CMD_FALSE="/usr/bin/false"
    BL64_OS_CMD_GAWK='/usr/bin/gawk'
    BL64_OS_CMD_GREP='/usr/bin/grep'
    BL64_OS_CMD_HOSTNAME='/usr/bin/hostname'
    BL64_OS_CMD_ID='/usr/bin/id'
    BL64_OS_CMD_LN='/bin/ln'
    BL64_OS_CMD_LS='/usr/bin/ls'
    BL64_OS_CMD_MKDIR='/usr/bin/mkdir'
    BL64_OS_CMD_MKTEMP='/usr/bin/mktemp'
    BL64_OS_CMD_MV='/usr/bin/mv'
    BL64_OS_CMD_RM='/usr/bin/rm'
    BL64_OS_CMD_TAR='/bin/tar'
    BL64_OS_CMD_TRUE="/usr/bin/true"
    BL64_OS_CMD_UNAME='/bin/uname'
    ;;
  ${BL64_OS_ALP}-*)
    BL64_OS_CMD_AWK='/usr/bin/awk'
    BL64_OS_CMD_CAT='/bin/cat'
    BL64_OS_CMD_CHMOD='/bin/chmod'
    BL64_OS_CMD_CHOWN='/bin/chown'
    BL64_OS_CMD_CP='/bin/cp'
    BL64_OS_CMD_DATE="/bin/date"
    BL64_OS_CMD_FALSE="/bin/false"
    BL64_OS_CMD_GAWK='/usr/bin/gawk'
    BL64_OS_CMD_GREP='/bin/grep'
    BL64_OS_CMD_HOSTNAME='/bin/hostname'
    BL64_OS_CMD_ID='/usr/bin/id'
    BL64_OS_CMD_LN='/bin/ln'
    BL64_OS_CMD_LS='/bin/ls'
    BL64_OS_CMD_MKDIR='/bin/mkdir'
    BL64_OS_CMD_MKTEMP='/bin/mktemp'
    BL64_OS_CMD_MV='/bin/mv'
    BL64_OS_CMD_RM='/bin/rm'
    BL64_OS_CMD_TAR='/bin/tar'
    BL64_OS_CMD_TRUE="/bin/true"
    BL64_OS_CMD_UNAME='/bin/uname'
    ;;
  ${BL64_OS_MCOS}-*)
    BL64_OS_CMD_AWK='/usr/bin/awk'
    BL64_OS_CMD_CAT='/bin/cat'
    BL64_OS_CMD_CHMOD='/bin/chmod'
    BL64_OS_CMD_CHOWN='/usr/sbin/chown'
    BL64_OS_CMD_CP='/bin/cp'
    BL64_OS_CMD_DATE="/bin/date"
    BL64_OS_CMD_FALSE="/usr/bin/false"
    BL64_OS_CMD_GAWK='/usr/bin/gawk'
    BL64_OS_CMD_GREP='/usr/bin/grep'
    BL64_OS_CMD_HOSTNAME='/bin/hostname'
    BL64_OS_CMD_ID='/usr/bin/id'
    BL64_OS_CMD_LN='/bin/ln'
    BL64_OS_CMD_LS='/bin/ls'
    BL64_OS_CMD_MKDIR='/bin/mkdir'
    BL64_OS_CMD_MKTEMP='/usr/bin/mktemp'
    BL64_OS_CMD_MV='/bin/mv'
    BL64_OS_CMD_RM='/bin/rm'
    BL64_OS_CMD_TAR='/usr/bin/tar'
    BL64_OS_CMD_TRUE="/usr/bin/true"
    BL64_OS_CMD_UNAME='/usr/bin/uname'
    ;;
  esac
}

function bl64_os_set_alias() {
  local cmd_mawk='/usr/bin/mawk'

  case "$BL64_OS_DISTRO" in
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-* | ${BL64_OS_FD}-* | ${BL64_OS_CNT}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* | ${BL64_OS_OL}-*)
    if [[ -x "$cmd_mawk" ]]; then
      BL64_OS_ALIAS_AWK="$cmd_mawk"
    else
      BL64_OS_ALIAS_AWK="$BL64_OS_CMD_GAWK --traditional"
    fi
    BL64_OS_ALIAS_CHOWN_DIR="$BL64_OS_CMD_CHOWN --verbose --recursive"
    BL64_OS_ALIAS_CP_DIR="$BL64_OS_CMD_CP --verbose --force --recursive"
    BL64_OS_ALIAS_CP_FILE="$BL64_OS_CMD_CP --verbose --force"
    BL64_OS_ALIAS_ID_USER="$BL64_OS_CMD_ID -u -n"
    BL64_OS_ALIAS_LN_SYMBOLIC="$BL64_OS_CMD_LN --verbose --symbolic"
    BL64_OS_ALIAS_LS_FILES="$BL64_OS_CMD_LS --color=never"
    BL64_OS_ALIAS_MKDIR_FULL="$BL64_OS_CMD_MKDIR --parents --verbose"
    BL64_OS_ALIAS_MKTEMP_DIR="$BL64_OS_CMD_MKTEMP -d"
    BL64_OS_ALIAS_MKTEMP_FILE="$BL64_OS_CMD_MKTEMP"
    BL64_OS_ALIAS_MV="$BL64_OS_CMD_MV --force --verbose"
    BL64_OS_ALIAS_RM_FILE="$BL64_OS_CMD_RM --verbose --force --one-file-system"
    BL64_OS_ALIAS_RM_FULL="$BL64_OS_CMD_RM --verbose --force --one-file-system --recursive"
    ;;
  ${BL64_OS_ALP}-*)
    BL64_OS_ALIAS_AWK="$BL64_OS_CMD_GAWK --traditional"
    BL64_OS_ALIAS_CHOWN_DIR="$BL64_OS_CMD_CHOWN -v -R"
    BL64_OS_ALIAS_CP_DIR="$BL64_OS_CMD_CP -v -f -R"
    BL64_OS_ALIAS_CP_FILE="$BL64_OS_CMD_CP -v -f"
    BL64_OS_ALIAS_ID_USER="$BL64_OS_CMD_ID -u -n"
    BL64_OS_ALIAS_LN_SYMBOLIC="$BL64_OS_CMD_LN -v -s"
    BL64_OS_ALIAS_LS_FILES="$BL64_OS_CMD_LS --color=never"
    BL64_OS_ALIAS_MKDIR_FULL="$BL64_OS_CMD_MKDIR -p"
    BL64_OS_ALIAS_MKTEMP_DIR="$BL64_OS_CMD_MKTEMP -d"
    BL64_OS_ALIAS_MKTEMP_FILE="$BL64_OS_CMD_MKTEMP"
    BL64_OS_ALIAS_MV="$BL64_OS_CMD_MV -f"
    BL64_OS_ALIAS_RM_FILE="$BL64_OS_CMD_RM -f"
    BL64_OS_ALIAS_RM_FULL="$BL64_OS_CMD_RM -f -R"
    ;;
  ${BL64_OS_MCOS}-*)
    BL64_OS_ALIAS_AWK="$BL64_OS_CMD_AWK"
    BL64_OS_ALIAS_CHOWN_DIR="$BL64_OS_CMD_CHOWN -v -R"
    BL64_OS_ALIAS_CP_DIR="$BL64_OS_CMD_CP -v -f -R"
    BL64_OS_ALIAS_CP_FILE="$BL64_OS_CMD_CP -v -f"
    BL64_OS_ALIAS_ID_USER="$BL64_OS_CMD_ID -u -n"
    BL64_OS_ALIAS_LN_SYMBOLIC="$BL64_OS_CMD_LN -v -s"
    BL64_OS_ALIAS_LS_FILES="$BL64_OS_CMD_LS --color=never"
    BL64_OS_ALIAS_MKDIR_FULL="$BL64_OS_CMD_MKDIR -v -p"
    BL64_OS_ALIAS_MKTEMP_DIR="$BL64_OS_CMD_MKTEMP -d"
    BL64_OS_ALIAS_MKTEMP_FILE="$BL64_OS_CMD_MKTEMP"
    BL64_OS_ALIAS_MV="$BL64_OS_CMD_MV -v -f"
    BL64_OS_ALIAS_RM_FILE="$BL64_OS_CMD_RM -v -f"
    BL64_OS_ALIAS_RM_FULL="$BL64_OS_CMD_RM -v -f -R"
    ;;
  esac
}

function bl64_os_chown_dir() {
  $BL64_OS_ALIAS_CHOWN_DIR "$@"
}

function bl64_os_cp_file() {
  $BL64_OS_ALIAS_CP_FILE "$@"
}

function bl64_os_cp_dir() {
  $BL64_OS_ALIAS_CP_DIR "$@"
}

function bl64_os_merge_dir() {
  local source="${1:-${BL64_LIB_VAR_TBD}}"
  local target="${2:-${BL64_LIB_VAR_TBD}}"
  local status=0

  bl64_check_parameter 'source' &&
    bl64_check_parameter 'target' &&
    bl64_check_directory "$source" &&
    bl64_check_directory "$target" ||
    return 1

  case "$BL64_OS_DISTRO" in
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-* | ${BL64_OS_FD}-* | ${BL64_OS_CNT}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* | ${BL64_OS_OL}-*)
    $BL64_OS_ALIAS_CP_DIR --no-target-directory "$source" "$target"
    status=$?
    ;;
  ${BL64_OS_MACOS}-*)
    $BL64_OS_ALIAS_CP_DIR ${source}/ "$target"
    status=$?
    ;;
  ${BL64_OS_ALP}-*)
    shopt -sq dotglob
    $BL64_OS_ALIAS_CP_DIR ${source}/* -t "$target"
    status=$?
    shopt -uq dotglob
    ;;
  esac

  return $status
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
  return 0
}

function bl64_os_cleanup_logs() {
  local target='/var/log'

  if [[ -d "$target" ]]; then
    $BL64_OS_ALIAS_RM_FULL ${target}/[[:alnum:]]*
  fi
  return 0
}

function bl64_os_cleanup_caches() {
  local target='/var/cache/man'

  if [[ -d "$target" ]]; then
    $BL64_OS_ALIAS_RM_FULL ${target}/[[:alnum:]]*
  fi
  return 0
}

function bl64_os_cleanup_full() {
  bl64_pkg_cleanup
  bl64_os_cleanup_tmps
  bl64_os_cleanup_logs
  bl64_os_cleanup_caches

  return 0
}

function bl64_pkb_set_command() {
  case "$BL64_OS_DISTRO" in
  ${BL64_OS_FD}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* )
    BL64_PKG_CMD_DNF='/usr/bin/dnf'
    ;;
  ${BL64_OS_CNT}-8* | ${BL64_OS_CNT}-9* | ${BL64_OS_OL}-8*)
    BL64_PKG_CMD_DNF='/usr/bin/dnf'
    ;;
  ${BL64_OS_CNT}-7* | ${BL64_OS_OL}-7*)
    BL64_PKG_CMD_YUM='/usr/bin/yum'
    ;;
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-*)
    BL64_PKG_CMD_APT='/usr/bin/apt-get'
    ;;
  ${BL64_OS_ALP}-*)
    BL64_PKG_CMD_APK='/sbin/apk'
    ;;
  ${BL64_OS_MCOS}-*)
    BL64_PKG_CMD_BRW='/opt/homebrew/bin/brew'
    ;;
  esac
}

function bl64_pkb_set_alias() {
  case "$BL64_OS_DISTRO" in
  ${BL64_OS_FD}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* )
    BL64_PKG_ALIAS_DNF_CACHE="$BL64_PKG_CMD_DNF --color=never makecache"
    BL64_PKG_ALIAS_DNF_INSTALL="$BL64_PKG_CMD_DNF --color=never --nodocs --assumeyes install"
    BL64_PKG_ALIAS_DNF_CLEAN="$BL64_PKG_CMD_DNF clean all"
    ;;
  ${BL64_OS_CNT}-8* | ${BL64_OS_CNT}-9* | ${BL64_OS_OL}-8*)
    BL64_PKG_ALIAS_DNF_CACHE="$BL64_PKG_CMD_DNF --color=never makecache"
    BL64_PKG_ALIAS_DNF_INSTALL="$BL64_PKG_CMD_DNF --color=never --nodocs --assumeyes install"
    BL64_PKG_ALIAS_DNF_CLEAN="$BL64_PKG_CMD_DNF clean all"
    ;;
  ${BL64_OS_CNT}-7* | ${BL64_OS_OL}-7*)
    BL64_PKG_ALIAS_YUM_CACHE="$BL64_PKG_CMD_YUM --color=never makecache"
    BL64_PKG_ALIAS_YUM_INSTALL="$BL64_PKG_CMD_YUM --color=never --assumeyes install"
    BL64_PKG_ALIAS_YUM_CLEAN="$BL64_PKG_CMD_YUM clean all"
    ;;
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-*)
    BL64_PKG_ALIAS_APT_UPDATE="$BL64_PKG_CMD_APT update"
    BL64_PKG_ALIAS_APT_INSTALL="$BL64_PKG_CMD_APT --assume-yes install"
    BL64_PKG_ALIAS_APT_CLEAN="$BL64_PKG_CMD_APT clean"
    ;;
  ${BL64_OS_ALP}-*)
    BL64_PKG_ALIAS_APK_INSTALL="$BL64_PKG_CMD_APK add --verbose"
    BL64_PKG_ALIAS_APK_UPDATE="$BL64_PKG_CMD_APK update"
    ;;
  ${BL64_OS_MCOS}-*)
    BL64_PKG_ALIAS_BRW_INSTALL="$BL64_PKG_CMD_BRW install"
    BL64_PKG_ALIAS_BRW_CLEAN="$BL64_PKG_CMD_BRW cleanup --prune=all -s"
    ;;
  esac
}

function bl64_pkg_deploy() {
  bl64_pkg_prepare &&
    bl64_pkg_install "$@" &&
    bl64_pkg_cleanup
}

function bl64_pkg_prepare() {
  case "$BL64_OS_DISTRO" in
  ${BL64_OS_FD}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* )
    $BL64_PKG_ALIAS_DNF_CACHE
    ;;
  ${BL64_OS_CNT}-8* | ${BL64_OS_CNT}-9* | ${BL64_OS_OL}-8*)
    $BL64_PKG_ALIAS_DNF_CACHE
    ;;
  ${BL64_OS_CNT}-7* | ${BL64_OS_OL}-7*)
    $BL64_PKG_ALIAS_YUM_CACHE
    ;;
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-*)
    export DEBIAN_FRONTEND="noninteractive"
    $BL64_PKG_ALIAS_APT_UPDATE
    ;;
  ${BL64_OS_ALP}-*)
    $BL64_PKG_ALIAS_APK_UPDATE
    ;;
  ${BL64_OS_MCOS}-*)
    :
    ;;
  esac
}

function bl64_pkg_install() {
  case "$BL64_OS_DISTRO" in
  ${BL64_OS_FD}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* )
    $BL64_PKG_ALIAS_DNF_INSTALL -- "$@"
    ;;
  ${BL64_OS_CNT}-8* | ${BL64_OS_CNT}-9* | ${BL64_OS_OL}-8*)
    $BL64_PKG_ALIAS_DNF_INSTALL -- "$@"
    ;;
  ${BL64_OS_CNT}-7* | ${BL64_OS_OL}-7*)
    $BL64_PKG_ALIAS_YUM_INSTALL -- "$@"
    ;;
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-*)
    export DEBIAN_FRONTEND="noninteractive"
    $BL64_PKG_ALIAS_APT_INSTALL -- "$@"
    ;;
  ${BL64_OS_ALP}-*)
    $BL64_PKG_ALIAS_APK_INSTALL -- "$@"
    ;;
  ${BL64_OS_MCOS}-*)
    $BL64_PKG_ALIAS_BRW_INSTALL "$@"
    ;;
  esac
}

function bl64_pkg_cleanup() {
  local target=''

  case "$BL64_OS_DISTRO" in
  ${BL64_OS_FD}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* )
    $BL64_PKG_ALIAS_DNF_CLEAN
    ;;
  ${BL64_OS_CNT}-8* | ${BL64_OS_CNT}-9* | ${BL64_OS_OL}-8*)
    $BL64_PKG_ALIAS_DNF_CLEAN
    ;;
  ${BL64_OS_CNT}-7* | ${BL64_OS_OL}-7*)
    $BL64_PKG_ALIAS_YUM_CLEAN
    ;;
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-*)
    export DEBIAN_FRONTEND="noninteractive"
    $BL64_PKG_ALIAS_APT_CLEAN
    ;;
  ${BL64_OS_ALP}-*)
    target='/var/cache/apk'
    if [[ -d "$target" ]]; then
      $BL64_OS_ALIAS_RM_FULL ${target}/[[:alpha:]]*
    fi
    ;;
  ${BL64_OS_MCOS}-*)
    $BL64_PKG_ALIAS_BRW_CLEAN
    ;;
  esac
}

function bl64_rnd_get_range() {
  local min="${1:-$BL64_RND_RANDOM_MIN}"
  local max="${2:-$BL64_RND_RANDOM_MAX}"
  local modulo=0

  (( min < BL64_RND_RANDOM_MIN )) && bl64_msg_show_error "$_BL64_RND_TXT_LENGHT_MIN $BL64_RND_RANDOM_MIN" && return $BL64_RND_ERROR_MIN
  (( max > BL64_RND_RANDOM_MAX )) && bl64_msg_show_error "$_BL64_RND_TXT_LENGHT_MAX $BL64_RND_RANDOM_MAX" && return $BL64_RND_ERROR_MAX

  modulo=$(( max - min + 1))

  printf '%s' "$(( min + (RANDOM % modulo) ))"
}

function bl64_rnd_get_numeric() {
  local length="${1:-$BL64_RND_LENGTH_1}"
  local seed=''

  (( length < BL64_RND_LENGTH_1 )) && bl64_msg_show_error "$_BL64_RND_TXT_LENGHT_MIN $BL64_RND_LENGTH_1" && return $BL64_RND_ERROR_MIN
  (( length > BL64_RND_LENGTH_20 )) && bl64_msg_show_error "$_BL64_RND_TXT_LENGHT_MAX $BL64_RND_LENGTH_20" && return $BL64_RND_ERROR_MAX

  seed="${RANDOM}${RANDOM}${RANDOM}${RANDOM}${RANDOM}"
  printf '%s' "${seed:0:$length}"
}

function bl64_rnd_get_alphanumeric() {
  local length="${1:-BL64_RND_LENGTH_1}"
  local output=''
  local item=''
  local index=0
  local count=0

  (( length < BL64_RND_LENGTH_1 )) && bl64_msg_show_error "$_BL64_RND_TXT_LENGHT_MIN $BL64_RND_LENGTH_1" && return $BL64_RND_ERROR_MIN
  (( length > BL64_RND_LENGTH_100 )) && bl64_msg_show_error "$_BL64_RND_TXT_LENGHT_MAX $BL64_RND_LENGTH_100" && return $BL64_RND_ERROR_MAX

  while (( count < length )); do
    index=$( bl64_rnd_get_range '0' "$BL64_RND_POOL_ALPHANUMERIC_MAX_IDX" )
    item="$( printf '%s' "${BL64_RND_POOL_ALPHANUMERIC:$index:1}" )"
    output="${output}${item}"
    (( count++ ))
  done

  printf '%s' "$output"
}

function _bl64_rxtx_backup() {

  local destination="$1"
  local backup="${destination}${_BL64_RXTX_BACKUP_POSTFIX}"
  local status=0

  if [[ -e "$destination" ]]; then
    bl64_os_mv "$destination" "$backup"
    status=$?
  fi

  ((status != 0)) && status=$BL64_RXTX_ERROR_BACKUP
  return $status
}

function _bl64_rxtx_restore() {
  local destination="$1"
  local result="$2"
  local backup="${destination}${_BL64_RXTX_BACKUP_POSTFIX}"
  local status=0

  if [[ "$result" == "$BL64_LIB_VAR_OK" ]]; then
    [[ -e "$backup" ]] && bl64_os_rm_full "$backup"
    return $BL64_LIB_VAR_OK
  fi

  [[ -e "$destination" ]] && bl64_os_rm_full "$destination"

  bl64_os_mv "$backup" "$destination"
  status=$?

  ((status != 0)) && status=$BL64_RXTX_ERROR_RESTORE
  return $status
}

function bl64_rxtx_set_command() {
  case "$BL64_OS_DISTRO" in
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-* | ${BL64_OS_FD}-* | ${BL64_OS_CNT}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* | ${BL64_OS_OL}-* | ${BL64_OS_ALP}-* | ${BL64_OS_MCOS}-*)
    BL64_RXTX_CMD_CURL='/usr/bin/curl'
    BL64_RXTX_CMD_WGET='/usr/bin/wget'
    ;;
  esac
}

function bl64_rxtx_set_alias() {
  case "$BL64_OS_DISTRO" in
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-11.* | ${BL64_OS_FD}-*)
    BL64_RXTX_ALIAS_CURL="$BL64_RXTX_CMD_CURL --no-progress-meter  --config /dev/null"
    BL64_RXTX_ALIAS_WGET="$BL64_RXTX_CMD_WGET --no-config"
    BL64_RXTX_SET_CURL_VERBOSE='--verbose'
    BL64_RXTX_SET_WGET_VERBOSE='--verbose'
    BL64_RXTX_SET_CURL_OUTPUT='--output'
    BL64_RXTX_SET_WGET_OUTPUT='--output-document'
    ;;
  ${BL64_OS_CNT}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* | ${BL64_OS_OL}-* | ${BL64_OS_DEB}-9.* | ${BL64_OS_DEB}-10.*)
    BL64_RXTX_ALIAS_CURL="$BL64_RXTX_CMD_CURL --config /dev/null"
    BL64_RXTX_ALIAS_WGET="$BL64_RXTX_CMD_WGET --no-config"
    BL64_RXTX_SET_CURL_VERBOSE='--verbose'
    BL64_RXTX_SET_WGET_VERBOSE='--verbose'
    BL64_RXTX_SET_CURL_OUTPUT='--output'
    BL64_RXTX_SET_WGET_OUTPUT='--output-document'
    ;;
  ${BL64_OS_ALP}-*)
    BL64_RXTX_ALIAS_CURL="$BL64_RXTX_CMD_CURL"
    BL64_RXTX_ALIAS_WGET="$BL64_RXTX_CMD_WGET"
    BL64_RXTX_SET_CURL_VERBOSE='--verbose'
    BL64_RXTX_SET_WGET_VERBOSE='--verbose'
    BL64_RXTX_SET_CURL_OUTPUT='--output'
    BL64_RXTX_SET_WGET_OUTPUT='-O'
    ;;
  ${BL64_OS_MCOS}-*)
    BL64_RXTX_ALIAS_CURL="$BL64_RXTX_CMD_CURL --no-progress-meter  --config /dev/null"
    BL64_RXTX_ALIAS_WGET="$BL64_RXTX_CMD_WGET --no-config"
    BL64_RXTX_SET_CURL_VERBOSE='--verbose'
    BL64_RXTX_SET_WGET_VERBOSE='--verbose'
    BL64_RXTX_SET_CURL_OUTPUT='--output'
    BL64_RXTX_SET_WGET_OUTPUT='--output-document'
    ;;
  esac
}

function bl64_rxtx_web_get_file() {
  local source="$1"
  local destination="$2"
  local replace="${3:-$BL64_LIB_VAR_OFF}"
  local verbose=''
  local status=0

  if [[ -z "$source" ]]; then
    bl64_msg_show_error "$_BL64_RXTX_TXT_MISSING_PARAMETER (source url)"
    return $BL64_RXTX_ERROR_MISSING_PARAMETER
  fi

  if [[ -z "$destination" ]]; then
    bl64_msg_show_error "$_BL64_RXTX_TXT_MISSING_PARAMETER (source url)"
    return $BL64_RXTX_ERROR_MISSING_PARAMETER
  fi

  [[ "$replace" == "$BL64_LIB_VAR_OFF" && -e "$destination" ]] && return 0
  _bl64_rxtx_backup "$destination" >/dev/null || return $?

  if [[ -x "$BL64_RXTX_CMD_CURL" ]]; then
    [[ "$BL64_LIB_DEBUG" == "$BL64_DBG_TARGET_CMD" ]] && verbose="$BL64_RXTX_SET_CURL_VERBOSE"
    $BL64_RXTX_ALIAS_CURL $verbose \
      $BL64_RXTX_SET_CURL_OUTPUT "$destination" \
      "$source"
    status=$?
  elif [[ -x "$BL64_RXTX_CMD_WGET" ]]; then
    [[ "$BL64_LIB_DEBUG" == "$BL64_DBG_TARGET_CMD" ]] && verbose="$BL64_RXTX_SET_WGET_VERBOSE"
    $BL64_RXTX_ALIAS_WGET $verbose \
      $BL64_RXTX_SET_WGET_OUTPUT "$destination" \
      "$source"
    status=$?
  else
    bl64_msg_show_error "$_BL64_RXTX_TXT_MISSING_COMMAND (wget or curl)" &&
      return $BL64_RXTX_ERROR_MISSING_COMMAND
  fi
  _bl64_rxtx_restore "$destination" "$status" >/dev/null || return $?

  return $status
}

function bl64_rxtx_git_get_dir() {
  local source_url="${1}"
  local source_path="${2}"
  local destination="${3}"
  local replace="${4:-$BL64_LIB_VAR_OFF}"
  local branch="${5:-main}"
  local repo=''
  local target=''
  local source=''
  local status=0

  bl64_check_parameter 'source_url' 'git repository' &&
    bl64_check_parameter 'source_path' 'source path' &&
    bl64_check_parameter 'destination' 'target destination' ||
    return $BL64_RXTX_ERROR_MISSING_PARAMETER

  [[ "$replace" == "$BL64_LIB_VAR_OFF" && -e "$destination" ]] && return $BL64_LIB_VAR_OK
  _bl64_rxtx_backup "$destination" >/dev/null || return $?

  repo="$($BL64_OS_ALIAS_MKTEMP_DIR)"
  bl64_check_directory "$repo" 'unable to create temporary git repo' || return $BL64_RXTX_ERROR_TEMPORARY_REPO

  source="${repo}/${source_path}"
  target="$(bl64_fmt_basename "$destination")"
  transition="${repo}/transition/${target}"

  bl64_vcs_git_sparse "$source_url" "$repo" "$branch" "$source_path" &&
    [[ -d "$source" ]] &&
    bl64_os_mkdir_full "${repo}/transition" &&
    bl64_os_mv "$source" "$transition" >/dev/null &&
    bl64_os_mv "${transition}" "$destination" >/dev/null
  status=$?

  _bl64_rxtx_restore "$destination" "$status" >/dev/null || return $?
  [[ -d "$repo" ]] && bl64_os_rm_full "$repo" >/dev/null

  return $status
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
  $BL64_OS_ALIAS_AWK \
    -v ControlUsr="$user" \
    '
      BEGIN { Found = 0 }
      ControlUsr " ALL=(ALL) NOPASSWD: ALL" == $0 { Found = 1 }
      { print $0 }
      END {
        if( Found == 0) {
          print( ControlUsr " ALL=(ALL) NOPASSWD: ALL" )
        }
      }
    ' \
    "$BL64_SUDO_FILE_SUDOERS" >"$new_sudoers"

  if [[ -s "$new_sudoers" ]]; then
    $BL64_OS_ALIAS_CP_FILE "${BL64_SUDO_FILE_SUDOERS}" "$old_sudoers"
  fi
  if [[ -s "$new_sudoers" && -s "$old_sudoers" ]]; then
    "$BL64_OS_CMD_CAT" "${BL64_SUDO_FILE_SUDOERS}.bl64_new" >"${BL64_SUDO_FILE_SUDOERS}" &&
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

  if ((status != 0)); then
    bl64_msg_show_error "$_BL64_SUDO_TXT_INVALID_SUDOERS ($sudoers)"
  fi

  return $status
}

function bl64_sudo_set_command() {
  case "$BL64_OS_DISTRO" in
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-* | ${BL64_OS_FD}-* | ${BL64_OS_CNT}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* | ${BL64_OS_OL}-* | ${BL64_OS_ALP}-* | ${BL64_OS_MCOS}-*)
    BL64_SUDO_CMD_SUDO='/usr/bin/sudo'
    BL64_SUDO_CMD_VISUDO='/usr/sbin/visudo'
    BL64_SUDO_FILE_SUDOERS='/etc/sudoers'
    ;;
  esac
}

function bl64_sudo_set_alias() {
  case "$BL64_OS_DISTRO" in
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-* | ${BL64_OS_FD}-* | ${BL64_OS_CNT}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* | ${BL64_OS_OL}-* | ${BL64_OS_ALP}-* | ${BL64_OS_MCOS}-*)
    BL64_SUDO_ALIAS_SUDO_ENV="$BL64_SUDO_CMD_SUDO --preserve-env --set-home"
    ;;
  esac
}

function bl64_txt_search_line() {
  local source="${1:--}"
  local line="$2"

  "$BL64_OS_CMD_GREP" -E "^${line}$" "$source" > /dev/null
}

function bl64_vcs_set_command() {
  case "$BL64_OS_DISTRO" in
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-* | ${BL64_OS_FD}-* | ${BL64_OS_CNT}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* | ${BL64_OS_OL}-* | ${BL64_OS_ALP}-* | ${BL64_OS_MCOS}-*)
    BL64_VCS_CMD_GIT='/usr/bin/git'
    ;;
  esac
}

function bl64_vcs_set_alias() {
  case "$BL64_OS_DISTRO" in
  ${BL64_OS_UB}-* | ${BL64_OS_DEB}-* | ${BL64_OS_FD}-* | ${BL64_OS_CNT}-* | ${BL64_OS_RHEL}-* | ${BL64_OS_ALM}-* | ${BL64_OS_OL}-* | ${BL64_OS_ALP}-* | ${BL64_OS_MCOS}-*)
    BL64_VCS_ALIAS_GIT="$BL64_VCS_CMD_GIT"
    ;;
  esac
}

function bl64_vcs_git_clone() {
  local source="${1}"
  local destination="${2}"
  local branch="${3:-main}"

  bl64_check_command "$BL64_VCS_CMD_GIT" || return $BL64_VCS_ERROR_MISSING_COMMAND

  bl64_check_parameter 'source' 'repository source' &&
    bl64_check_parameter 'destination' 'repository destination' ||
    return $BL64_VCS_ERROR_MISSING_PARAMETER

  [[ ! -d "$destination" ]] && bl64_os_mkdir_full "$destination"
  bl64_check_directory "$destination" || return $BL64_VCS_ERROR_DESTINATION_ERROR

  cd "$destination" || return $BL64_VCS_ERROR_DESTINATION_ERROR

  $BL64_VCS_ALIAS_GIT \
    clone \
    --depth 1 \
    --single-branch \
    --branch "$branch" \
    "$source"
}

function bl64_vcs_git_sparse() {
  bl64_dbg_lib_trace_start
  local source="${1}"
  local destination="${2}"
  local branch="${3:-main}"
  local pattern="${4}"
  local item=''
  local status=0

  bl64_check_command "$BL64_VCS_CMD_GIT" || return $BL64_VCS_ERROR_MISSING_COMMAND

  bl64_check_parameter 'source' 'repository source' &&
    bl64_check_parameter 'destination' 'repository destination' &&
    bl64_check_parameter 'pattern' 'pattern list' || return $BL64_VCS_ERROR_MISSING_PARAMETER

  [[ ! -d "$destination" ]] && bl64_os_mkdir_full "$destination"
  bl64_check_directory "$destination" || return $BL64_VCS_ERROR_DESTINATION_ERROR

  cd "$destination" || return $BL64_VCS_ERROR_DESTINATION_ERROR

  if bl64_os_match 'DEB-9' 'DEB-10' 'UB-20' 'OL-7' 'CNT-7'; then
    $BL64_VCS_ALIAS_GIT init &&
      $BL64_VCS_ALIAS_GIT remote add origin "$source" &&
      $BL64_VCS_ALIAS_GIT config core.sparseCheckout true &&
      {
        IFS=' '
        for item in $pattern; do echo "$item" >>'.git/info/sparse-checkout'; done
        unset IFS
      } &&
      $BL64_VCS_ALIAS_GIT pull --depth 1 origin "$branch"
  else
    $BL64_VCS_ALIAS_GIT init &&
      $BL64_VCS_ALIAS_GIT sparse-checkout set &&
      {
        IFS=' '
        for item in $pattern; do echo "$item"; done | $BL64_VCS_ALIAS_GIT sparse-checkout add --stdin
      } &&
      $BL64_VCS_ALIAS_GIT remote add origin "$source" &&
      $BL64_VCS_ALIAS_GIT pull --depth 1 origin "$branch"
  fi
  status=$?

  bl64_dbg_lib_trace_stop
  return $status
}

function bl64_xsv_dump() {

  local source="$1"

  bl64_check_parameter 'source' || return $?
  bl64_check_file "$source" "$_BL64_XSV_TXT_SOURCE_NOT_FOUND" || return $?

  "$BL64_OS_CMD_GREP" -v -E '^#.*$|^$' "$source"

}

function bl64_xsv_search_records() {
  local values="$1"
  local source="${2:--}"
  local keys="${3:-1}"
  local fields="${4:-0}"
  local fs_src="${5:-$BL64_XSV_FS_COLON}"
  local fs_out="${6:-$BL64_XSV_FS_COLON}"

  bl64_check_command "$BL64_OS_CMD_AWK" || return $BL64_XSV_ERROR_MISSING_COMMAND

  bl64_check_parameter 'values' 'search value' ||
    return $BL64_XSV_ERROR_MISSING_PARAMETER

  $BL64_OS_ALIAS_AWK \
    -F "$fs_src" \
    -v VALUES="${values}" \
    -v KEYS="$keys" \
    -v FIELDS="$fields" \
    -v FS_OUT="$fs_out" \
    '
      BEGIN {
        show_total = split( FIELDS, show_fields, ENVIRON["BL64_XSV_FS_COLON"] )
        keys_total = split( KEYS, keys_fields, ENVIRON["BL64_XSV_FS_COLON"] )
        values_total = split( VALUES, values_fields, ENVIRON["BL64_XSV_FS"] )
        if( keys_total != values_total ) {
          exit ENVIRON["BL64_XSV_ERROR_SEARCH_VALUES"]
        }
        row_match = ""
        count = 0
        found = 0
      }
      /^#/ || /^$/ { next }
      {
        found = 0
        for( count = 1; count <= keys_total; count++ ) {
          if ( $keys_fields[count] == values_fields[count] ) {
            found = 1
          } else {
            found = 0
            break
          }
        }

        if( found == 1 ) {
          row_match = $show_fields[1]
          for( count = 2; count <= show_total; count++ ) {
            row_match = row_match FS_OUT $show_fields[count]
          }
          print row_match
        }
      }
      END {}
    ' \
    "$source"

}

export LANG
export LC_ALL
export LANGUAGE

export BL64_LIB_CMD="${BL64_LIB_CMD:-0}"

export BL64_LIB_VERBOSE="${BL64_LIB_VERBOSE:-1}"

export BL64_LIB_DEBUG="${BL64_LIB_DEBUG:-0}"

export BL64_LIB_STRICT="${BL64_LIB_STRICT:-1}"

export BL64_LIB_LANG="${BL64_LIB_LANG:-1}"

export BL64_LIB_SIGNAL_HUP="${BL64_LIB_SIGNAL_HUP:--}"
export BL64_LIB_SIGNAL_STOP="${BL64_LIB_SIGNAL_STOP:--}"
export BL64_LIB_SIGNAL_QUIT="${BL64_LIB_SIGNAL_QUIT:--}"

export BL64_SCRIPT_NAME="${BL64_SCRIPT_NAME:-${0##*/}}"

export BL64_SCRIPT_PATH="${BL64_SCRIPT_PATH:-${BASH_SOURCE[0]%/*}}/"

export BL64_SCRIPT_SID="${BASHPID}"

readonly BL64_LIB_VAR_TBD='TBD'

readonly BL64_LIB_VAR_NULL='__s64__'
readonly BL64_LIB_VAR_TRUE='0'
readonly BL64_LIB_VAR_FALSE='1'
readonly BL64_LIB_VAR_ON='1'
readonly BL64_LIB_VAR_OFF='0'
readonly BL64_LIB_VAR_OK='0'


set -o pipefail

unset -f unalias
\unalias -a
unset -f command

unset MAIL
unset ENV
unset IFS

shopt -qu \
  dotglob \
  extdebug \
  failglob \
  globstar \
  gnu_errfmt \
  huponexit \
  lastpipe \
  login_shell \
  nocaseglob \
  nocasematch \
  nullglob \
  nullglob \
  xpg_echo
shopt -qs \
  extquote

if [[ "$BL64_LIB_STRICT" == '1' ]]; then
  set -u
  set -p
fi

trap "$BL64_LIB_SIGNAL_HUP" 'SIGHUP'
trap "$BL64_LIB_SIGNAL_STOP" 'SIGINT'
trap "$BL64_LIB_SIGNAL_QUIT" 'SIGQUIT'
trap "$BL64_LIB_SIGNAL_QUIT" 'SIGTERM'

export TERM="${TERM:-vt100}"

if [[ "$BL64_LIB_LANG" == '1' ]]; then
  export LANG='C'
  export LC_ALL='C'
  export LANGUAGE='C'
fi

bl64_os_get_distro

if [[ "$BL64_OS_DISTRO" == 'UNKNOWN' || ("${BASH_VERSINFO[0]}" != '4' && "${BASH_VERSINFO[0]}" != '5') ]]; then
  printf '%s\n' "Fatal: BashLib64 is not supported in the current OS ($(uname -a)) or Bash version ($BASH_VERSION)" >&2
  false
else
  bl64_os_set_command
  bl64_os_set_alias
  bl64_iam_set_command
  bl64_iam_set_alias
  bl64_pkb_set_command
  bl64_pkb_set_alias
  bl64_sudo_set_command
  bl64_sudo_set_alias
  bl64_vcs_set_command
  bl64_vcs_set_alias
  bl64_rxtx_set_command
  bl64_rxtx_set_alias

  [[ "$BL64_LIB_DEBUG" == "$BL64_DBG_TARGET_ALL_TRACE" ]] && set -x

  if [[ "$BL64_LIB_CMD" == "$BL64_LIB_VAR_ON" ]]; then
    "$@"
  else
    :
  fi
fi
