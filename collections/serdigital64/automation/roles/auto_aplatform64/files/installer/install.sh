#!/bin/bash
#######################################
#
# Install the A:Platform64 environment
#
# Project GIT repository: [https://github.com/serdigital64/aplatform64](https://github.com/serdigital64/aplatform64)
# Project Ansible Galaxy repository: [https://galaxy.ansible.com/serdigital64](https://galaxy.ansible.com/serdigital64)
# Project Documentation: [https://aplatform64.readthedocs.io](https://aplatform64.readthedocs.io)
#
# Author: [SerDigital64](https://serdigital64.github.io/)
# License: [GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
#
#######################################

# shellcheck disable=SC1091
source './bashlib64.bash'

function aplatform64_InstallOSPackage {

  local PythonPackage="$1"
  local Status=0

  # shellcheck disable=SC2086
  if [[ "$BL64_OS_DISTRO" == UBUNTU* || "$BL64_OS_DISTRO" == DEBIAN* ]]; then
    export DEBIAN_FRONTEND='noninteractive'
    $BL64_SUDO_ALIAS_SUDO_ENV $BL64_PKG_ALIAS_APT_UPDATE 2>&1 | bl64_log_record 'update-cache'
    $BL64_SUDO_ALIAS_SUDO_ENV $BL64_PKG_ALIAS_APT_INSTALL $PythonPackage 2>&1 | bl64_log_record 'install-packages'
    Status=$?
  elif [[ "$BL64_OS_DISTRO" == FEDORA* || "$BL64_OS_DISTRO" == OL* || "$BL64_OS_DISTRO" == CENTOS* ]]; then
    $BL64_SUDO_ALIAS_SUDO_ENV $BL64_PKG_ALIAS_DNF_CACHE 2>&1 | bl64_log_record 'update-cache'
    $BL64_SUDO_ALIAS_SUDO_ENV $BL64_PKG_ALIAS_DNF_INSTALL $PythonPackage 2>&1 | bl64_log_record 'install-packages'
    Status=$?
  fi

  ((Status != 0)) && bl64_log_error "Unable to install OS packages ($PythonPackage)"
  return $Status
}

function aplatform64_CreatePaths {

  local Status=0
  local CheckDir=''
  local Paths=''

  Paths="$APLATFORM64_PATH_ROOT $APLATFORM64_PATH_VAR"
  Paths="$Paths $APLATFORM64_PATH_BIN $APLATFORM64_PATH_ETC $APLATFORM64_PATH_ETC_CFG"
  Paths="$Paths $APLATFORM64_PATH_COLLECTIONS "
  Paths="$Paths $APLATFORM64_PATH_CACHE $APLATFORM64_PATH_CACHE_PIP $APLATFORM64_PATH_CACHE_GALAXY"

  CheckDir="$("$BL64_SUDO_CMD_SUDO" "$BL64_OS_CMD_LS" -d "$APLATFORM64_PATH_ROOT" 2>/dev/null)"
  if [[ -z "$CheckDir" ]]; then
    # shellcheck disable=SC2086
    "$BL64_SUDO_CMD_SUDO" "$BL64_OS_CMD_MKDIR" $Paths 2>&1 | bl64_log_record 'base-mkdir' &&
      "$BL64_SUDO_CMD_SUDO" \
        $BL64_OS_ALIAS_CHOWN_DIR \
        "${APLATFORM64_USR_CONTROL_NAME}:${APLATFORM64_USR_CONTROL_GROUP}" \
        "$APLATFORM64_PATH_ROOT" "$APLATFORM64_PATH_VAR" \
        2>&1 | bl64_log_record 'base-chown'
    Status=$?
    ((Status != 0)) && bl64_log_error "Unable to create target paths"
  fi

  return $Status

}

function aplatform64_PrepareHelpers {

  local Status=0
  local CheckFile=''

  CheckFile="$("$BL64_SUDO_CMD_SUDO" "$BL64_OS_CMD_LS" "$APLATFORM64_PATH_INSTALLER_YML" 2>/dev/null)"
  if [[ -z "$CheckFile" ]]; then

    # shellcheck disable=SC2086
    "$BL64_SUDO_CMD_SUDO" $BL64_OS_ALIAS_CP_FILE \
      "${APLATFORM64_SCRIPT_PATH}/install.sh" \
      "${APLATFORM64_SCRIPT_PATH}/install_helper.sh" \
      "${APLATFORM64_SCRIPT_PATH}/install_helper.yml" \
      "${APLATFORM64_SCRIPT_PATH}/bashlib64.bash" \
      "$APLATFORM64_PATH_BIN" \
      2>&1 | bl64_log_record 'base-chown'
    Status=$?

    # shellcheck disable=SC2086
    "$BL64_SUDO_CMD_SUDO" $BL64_OS_ALIAS_CHOWN_DIR \
      "${APLATFORM64_USR_CONTROL_NAME}:${APLATFORM64_USR_CONTROL_GROUP}" \
      "${APLATFORM64_PATH_BIN}" \
      2>&1 | bl64_log_record 'base-chown'

  fi

  ((Status != 0)) && bl64_log_error "Unable to prepare install helpers"
  return $Status

}

function aplatform64_UpdateSudoers {

  local Status=1

  bl64_log_task 'Update sudoers file'

  if [[ -z "$APLATFORM64_USR_CONTROL_NAME" ]]; then
    bl64_log_error "Unable to determine user's login name. Please set it and try again."
    return 1
  fi
  if [[ ! -f "$APLATFORM64_PATH_SUDOERS" ]]; then
    bl64_log_error "Sudoers not found ($APLATFORM64_PATH_SUDOERS). Please verify and try again."
    return 1
  fi

  aplatform64_CreatePaths || return 1
  aplatform64_PrepareHelpers || return 1

  $BL64_SUDO_ALIAS_SUDO_ENV \
    "${APLATFORM64_PATH_BIN}/install_helper.sh" 'sudoers' \
    2>&1 | bl64_log_record 'install_helper-sudoers'
  Status=$?
  ((Status != 0)) && bl64_log_error 'Unable to update sudoers'

  return $Status

}

function aplatform64_CreateUsers {

  local Status=0

  bl64_log_task 'Create management node account'

  if [[ ! -d "/home/${APLATFORM64_USR_CONTROL_NAME}" ]]; then
    "${BL64_SUDO_CMD_SUDO}" \
      "${BL64_OS_CMD_USERADD}" -m \
      -c "Ansible Controller management user" \
      -s "/bin/bash" \
      "${APLATFORM64_USR_CONTROL_NAME}" \
      2>&1 | bl64_log_record 'create-user'
    Status=$?
    ((Status != 0)) && bl64_log_error 'Unable to create user account'
  else
    bl64_log_warning "User account already created. No action taken."
  fi

  return $Status

}

function aplatform64_InstallPython {

  local Status=0
  local PythonPackage=''

  bl64_log_task 'Install Tools'

  case "$BL64_OS_DISTRO" in
  UBUNTU-*|DEBIAN-*) PythonPackage='debianutils' ;;
  FEDORA-*|CENTOS-*|OL-*) PythonPackage='which' ;;
  esac
  aplatform64_InstallOSPackage $PythonPackage

  if [[ -x "$APLATFORM64_CMD_PYTHON3" ]]; then
    bl64_log_warning "Python3 already installed ($APLATFORM64_CMD_PYTHON3)"
    return 0
  fi

  case "$BL64_OS_DISTRO" in
  UBUNTU-*) PythonPackage='python3.9 python3-pip' ;;
  FEDORA-*) PythonPackage='python3 python3-pip' ;;
  CENTOS-*) PythonPackage='python39 python39-pip' ;;
  OL-*) PythonPackage='python39 python39-pip' ;;
  DEBIAN-10*) PythonPackage='python3.7 python3-pip' ;;
  DEBIAN-11*) PythonPackage='python3.9 python3-pip' ;;
  esac

  aplatform64_InstallOSPackage $PythonPackage
  Status=$?

  ((Status != 0)) && bl64_log_error 'Unable to install Python'
  return $Status
}

function aplatform64_InstallVEW {

  local Status=1

  bl64_log_task 'Install VEW prerequisites'
  if [[ ! -x "$APLATFORM64_CMD_PYTHON3" ]]; then
    bl64_log_error "Python3 not found ($APLATFORM64_CMD_PYTHON3). Please install it and try again."
    return 1
  fi

  aplatform64_CreatePaths || return 1
  aplatform64_PrepareHelpers || return 1

  bl64_log_task 'Install VEW'
  if [[ "$APLATFORM64_USR_CONTROL_NAME" == "$APLATFORM64_USR_CURRENT" ]]; then
    "${APLATFORM64_PATH_BIN}/install_helper.sh" 'vew' \
      2>&1 | bl64_log_record 'install_helper-vew'
    Status=$?
  else
    $BL64_SUDO_ALIAS_SUDO_ENV --user "$APLATFORM64_USR_CONTROL_NAME" \
      "${APLATFORM64_PATH_BIN}/install_helper.sh" 'vew' \
      2>&1 | bl64_log_record 'install_helper-vew'
    Status=$?
  fi
  ((Status != 0)) && bl64_log_error 'Unable to install VEW'

  return $Status
}

function aplatform64_InstallAnsible {

  local Status=1

  aplatform64_CreatePaths || return 1
  aplatform64_PrepareHelpers || return 1

  bl64_log_task 'Install Ansible'
  if [[ "$APLATFORM64_USR_CONTROL_NAME" == "$APLATFORM64_USR_CURRENT" ]]; then
    "${APLATFORM64_PATH_BIN}/install_helper.sh" 'ansible' \
      2>&1 | bl64_log_record 'install_helper-ansible'
    Status=$?
  else
    $BL64_SUDO_ALIAS_SUDO_ENV --user "$APLATFORM64_USR_CONTROL_NAME" \
      "${APLATFORM64_PATH_BIN}/install_helper.sh" 'ansible' \
      2>&1 | bl64_log_record 'install_helper-ansible'
    Status=$?
  fi
  ((Status != 0)) && bl64_log_error 'Unable to install Ansible'

  return $Status

}

function aplatform64_InstallAPlatform64 {

  local Status=1

  aplatform64_CreatePaths || return 1
  aplatform64_PrepareHelpers || return 1

  bl64_log_task 'Install A:Platform64'
  if [[ "$APLATFORM64_USR_CONTROL_NAME" == "$APLATFORM64_USR_CURRENT" ]]; then
    "${APLATFORM64_PATH_BIN}/install_helper.sh" 'aplatform64' \
      2>&1 | bl64_log_record 'install_helper-aplatform64'
    Status=$?
  else
    $BL64_SUDO_ALIAS_SUDO_ENV --user "$APLATFORM64_USR_CONTROL_NAME" \
      "${APLATFORM64_PATH_BIN}/install_helper.sh" 'aplatform64' \
      2>&1 | bl64_log_record 'install_helper-aplatform64'
    Status=$?
  fi

  ((Status != 0)) && bl64_log_error 'Unable to install A:Platform64'

  return $Status

}

function aplatform64_SanityCheck {

  bl64_log_task 'Check parameters and environment'

  [[ ! ("$BL64_OS_DISTRO" =~ (UBUNTU-.*|FEDORA-.*|CENTOS-.*|OL-.*|DEBIAN-.*)) ]] &&
    bl64_log_error "Unsuported linux platform ($BL64_OS_DISTRO)" && return 1

  bl64_check_command "$BL64_SUDO_CMD_SUDO" || return 1
  bl64_check_command "$BL64_OS_CMD_USERADD" || return 1
  bl64_check_command "$BL64_OS_CMD_AWK" || return 1

  bl64_check_file "$APLATFORM64_SCRIPT_PATH/install_helper.sh" || return 1
  bl64_check_file "$APLATFORM64_SCRIPT_PATH/install_helper.yml" || return 1

  APLATFORM64_USR_CURRENT="$($BL64_OS_ALIAS_ID_USER)"
  APLATFORM64_USR_CONTROL_HOME="/home/${APLATFORM64_USR_CONTROL_NAME}"
  APLATFORM64_USR_CONTROL_GROUP="$APLATFORM64_USR_CONTROL_NAME"
  [[ -z "$APLATFORM64_PATH_ROOT" ]] && APLATFORM64_PATH_ROOT="${APLATFORM64_USR_CONTROL_HOME}/aplatform64"
  [[ -z "$APLATFORM64_PATH_VAR" ]] && APLATFORM64_PATH_VAR="${APLATFORM64_PATH_ROOT}/var"

  [[ "$APLATFORM64_PATH_ROOT" == '/aplatform64' ]] && bl64_log_error "Unable to set root path ($APLATFORM64_PATH_ROOT)" && return 1
  [[ "$APLATFORM64_PATH_VAR" == '/var' ]] && bl64_log_error "Unable to set var path ($APLATFORM64_PATH_VAR)" && return 1

  [[ -z "$APLATFORM64_VENVIRONMENT" ]] && bl64_log_error "Unable to determine python virtual environment (VEW) name" && return 1

  if [[ -z "$APLATFORM64_CMD_PYTHON3" ]]; then
    case "$BL64_OS_DISTRO" in
    UBUNTU-*) APLATFORM64_CMD_PYTHON3='/usr/bin/python3.9' ;;
    FEDORA-33) APLATFORM64_CMD_PYTHON3='/usr/bin/python3.9' ;;
    FEDORA-35) APLATFORM64_CMD_PYTHON3='/usr/bin/python3.10' ;;
    CENTOS-*) APLATFORM64_CMD_PYTHON3='/usr/bin/python3.9' ;;
    OL-*) APLATFORM64_CMD_PYTHON3='/usr/bin/python3.9' ;;
    DEBIAN-10*) APLATFORM64_CMD_PYTHON3='/usr/bin/python3.7' ;;
    DEBIAN-11*) APLATFORM64_CMD_PYTHON3='/usr/bin/python3.9' ;;
    esac
  fi
  APLATFORM64_CMD_PYTHON3_BASENAME="${APLATFORM64_CMD_PYTHON3##*/}"

  APLATFORM64_CMD_VEW="${APLATFORM64_USR_CONTROL_HOME}/.local/bin/virtualenvwrapper.sh"
  if [[ -f '/usr/bin/virtualenv' ]]; then
    APLATFORM64_CMD_VE='/usr/bin/virtualenv'
  else
    APLATFORM64_CMD_VE="${APLATFORM64_USR_CONTROL_HOME}/.local/bin/virtualenv"
  fi

  APLATFORM64_PATH_BIN="${APLATFORM64_PATH_ROOT}/bin"
  APLATFORM64_PATH_WORKON="${APLATFORM64_USR_CONTROL_HOME}/.virtualenvs"
  APLATFORM64_PATH_CACHE="${APLATFORM64_PATH_VAR}/cache"
  APLATFORM64_PATH_COLLECTIONS="${APLATFORM64_PATH_ROOT}/collections"
  APLATFORM64_PATH_CACHE_GALAXY="${APLATFORM64_PATH_CACHE}/galaxy"
  APLATFORM64_PATH_ROLES="${APLATFORM64_PATH_ROOT}/roles"
  APLATFORM64_PATH_CACHE_PIP="${APLATFORM64_PATH_CACHE}/pip"
  APLATFORM64_PATH_INSTALLER_YML="${APLATFORM64_PATH_BIN}/install_helper.yml"

  APLATFORM64_PATH_ETC="${APLATFORM64_PATH_ROOT}/etc"
  APLATFORM64_PATH_ETC_CFG="${APLATFORM64_PATH_ETC}/cfg"
  APLATFORM64_PATH_INSTALLER_OPTIONS="${APLATFORM64_PATH_ETC_CFG}/installer.yml"

  PATH="${APLATFORM64_USR_CONTROL_HOME}/.local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

  return 0

}

function aplatform64_Help() {

  bl64_msg_show_usage \
    '[-x] [-6] [-p] [-w] [-u] [-s] [-a] [-k] [-t SITE]  [-y PYTHON] [-m USER] [-v VENV] [-r PATH] [-o PATH] [-h]' \
    'Install the A:Platform64 environment' \
    '
  -x        : Run all installation steps: Python (-p), VEW (-w), Ansible (-a), account (-u), sudo rule (-s), A:Platform64 (-6)
  -6        : Single step: install A:Platform64
  -p        : Single step: Install python v3.9 using OS native package
  -w        : Single step: Install Virtual Environment Wrapper (VEW) python module
  -u        : Single step: Create Ansible control node account
  -s        : Single step: Give root privilege to the control node account by adding user rule to sudoers file
  -a        : Single step: Install Ansible
  -h        : Show usage info
    ' \
    '
  -k        : Let ansible-playbook ask for sudo password. Use when the target user doesn-t have the NOPASSWD: flag in sudoers.
    ' \
    "
  -t SITE   : Site name. Valid format: [a-z][0-9]. Default: ${APLATFORM64_SITE}
  -y PYTHON : Python3.9 interpreter path
  -m USER   : Control node account login name. Default: ${APLATFORM64_USR_CONTROL_NAME}
  -v VENV   : Python virtual environment name where Ansible will be installed to. Default: ${APLATFORM64_VENVIRONMENT}
  -r PATH   : Install path for collections and configurations. Default: ${APLATFORM64_PATH_ROOT}
  -o PATH   : VariableInstall path for temporary and run-time data. Default: ${APLATFORM64_PATH_VAR}"

}

#
# Main
#

export APLATFORM64_SCRIPT_PATH="${0%%/*}"

export APLATFORM64_INSTALL_LOG='aplatform64-install.log'
export APLATFORM64_MODULES='application automation backup cloud container database devops development'
APLATFORM64_MODULES="$APLATFORM64_MODULES hardware hypervisor infrastructure monitor network security storage system web"

export APLATFORM64_USR_CONTROL_NAME='sitectl'
export APLATFORM64_USR_CONTROL_HOME=''
export APLATFORM64_USR_CONTROL_GROUP=''
export APLATFORM64_USR_CURRENT=''
export APLATFORM64_VENVIRONMENT='aplatform64'
export APLATFORM64_SITE='site'
export APLATFORM64_BECOME=0

export APLATFORM64_CMD_VE=''
export APLATFORM64_CMD_VEW=''
export APLATFORM64_CMD_PYTHON3=''
export APLATFORM64_CMD_PYTHON3_BASENAME=''
export APLATFORM64_PATH_SUDOERS='/etc/sudoers'
export APLATFORM64_PATH_ROOT='/opt/aplatform64'
export APLATFORM64_PATH_VAR='/var/opt/aplatform64'
export APLATFORM64_PATH_BIN=''
export APLATFORM64_PATH_COLLECTIONS=''
export APLATFORM64_PATH_ROLES=''
export APLATFORM64_PATH_WORKON=''
export APLATFORM64_PATH_CACHE=''
export APLATFORM64_PATH_CACHE_PIP=''
export APLATFORM64_PATH_CACHE_GALAXY=''
export APLATFORM64_PATH_INSTALLER_YML=''
export APLATFORM64_PATH_ETC=''
export APLATFORM64_PATH_ETC_CFG=''
export APLATFORM64_PATH_INSTALLER_OPTIONS=''

export PATH="/usr/sbin:/usr/bin:/sbin:/bin"

declare aplatform64_CommandLine="$*"
declare aplatform64_Option=''
declare aplatform64_Selected=''
declare aplatform64_CreateUser=0
declare aplatform64_InstallAnsible=0
declare aplatform64_InstallAPlatform64=0
declare aplatform64_InstallPython=0
declare aplatform64_InstallVEW=0
declare aplatform64_InstallAll=0
declare aplatform64_UpdateSudoers=0

[[ -z "$aplatform64_CommandLine" ]] && aplatform64_Help 1 && exit 1
while getopts ':xhuawsk6pt:m:y:v:o:r:' aplatform64_Option; do
  case "$aplatform64_Option" in
  x)
    aplatform64_InstallAll=1
    aplatform64_Selected='1'
    ;;
  u)
    aplatform64_CreateUser=1
    aplatform64_Selected='1'
    ;;
  p)
    aplatform64_InstallPython=1
    aplatform64_Selected='1'
    ;;
  a)
    aplatform64_InstallAnsible=1
    aplatform64_Selected='1'
    ;;
  w)
    aplatform64_InstallVEW=1
    aplatform64_Selected='1'
    ;;
  s)
    aplatform64_UpdateSudoers=1
    aplatform64_Selected='1'
    ;;
  6)
    aplatform64_InstallAPlatform64=1
    aplatform64_Selected='1'
    ;;
  k) APLATFORM64_BECOME=1 ;;
  t) APLATFORM64_SITE="$OPTARG" ;;
  m) APLATFORM64_USR_CONTROL_NAME="$OPTARG" ;;
  r) APLATFORM64_PATH_ROOT="$OPTARG" ;;
  o) APLATFORM64_PATH_VAR="$OPTARG" ;;
  v) APLATFORM64_VENVIRONMENT="$OPTARG" ;;
  y) APLATFORM64_CMD_PYTHON3="$OPTARG" ;;
  h) aplatform64_Help && exit ;;
  \?) aplatform64_Help && exit 1 ;;
  esac
done
[[ -z "$aplatform64_CommandLine" || -z "$aplatform64_Selected" ]] && aplatform64_Help 1 && exit 1

bl64_log_setup "$APLATFORM64_INSTALL_LOG"
bl64_log_info "Start installation procedure. Arguments=[$aplatform64_CommandLine]"

aplatform64_SanityCheck || exit 1

[[ "$aplatform64_InstallAll" == '1' || "$aplatform64_CreateUser" == '1' ]] && { aplatform64_CreateUsers || exit 1; }
[[ "$aplatform64_InstallAll" == '1' || "$aplatform64_UpdateSudoers" == '1' ]] && { aplatform64_UpdateSudoers || exit 1; }
[[ "$aplatform64_InstallAll" == '1' || "$aplatform64_InstallPython" == '1' ]] && { aplatform64_InstallPython || exit 1; }
[[ "$aplatform64_InstallAll" == '1' || "$aplatform64_InstallVEW" == '1' ]] && { aplatform64_InstallVEW || exit 1; }
[[ "$aplatform64_InstallAll" == '1' || "$aplatform64_InstallAnsible" == '1' ]] && { aplatform64_InstallAnsible || exit 1; }
[[ "$aplatform64_InstallAll" == '1' || "$aplatform64_InstallAPlatform64" == '1' ]] && { aplatform64_InstallAPlatform64 || exit 1; }

bl64_log_info "Installation procedure finished (log: $APLATFORM64_INSTALL_LOG)"
exit 0
