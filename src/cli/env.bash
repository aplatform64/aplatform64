#
###[ embedded-bashlib64-end ]#####################
#

# Shell script name
readonly AP64_CLI='ap64'

# Install mark. Mapped to: auto_ansible_control_base['files']['cli_root']
readonly AP64_CLI_ROOT='.ap64-root'

# Python VEnv name
readonly AP64_VENV='venv'

# A:Platform64 paths
declare AP64_PATH_ROOT=''
declare AP64_PATH_VAR=''
declare AP64_PATH_INVENTORY=''
declare AP64_PATH_VENV=''
declare AP64_PATH_VENV_CACHE=''
declare AP64_PATH_VENV_TMP=''

# A:Platform64 files
declare AP64_FILE_ANSIBLE_CONTROL='ansible_control.env'
declare AP64_FILE_ANSIBLE_INVENTORY='aplatform64_service.ini'
declare AP64_FILE_CATALOG='catalog.csv'

# A:Platform64 node bootstrap SSH credentials
export AP64_NODE_USER
export AP64_NODE_PASSWORD
