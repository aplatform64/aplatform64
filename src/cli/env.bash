#
###[ embedded-bashlib64-end ]#####################
#

#
# CLI
#

# Shell script name
readonly AP64_CLI='ap64'

# Install mark. Mapped to: auto_ansible_control_base['files']['cli_root']
readonly AP64_CLI_ROOT='.ap64-root'

# Python VEnv name
readonly AP64_VENV='venv'

#
# A:Platform64
#

# Collections
declare AP64_NAMESPACE='serdigital64'
declare AP64_COLLECTIONS=''
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.application"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.automation"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.backup"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.cloud"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.container"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.database"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.development"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.devops"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.hardware"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.hypervisor"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.infrastructure"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.monitor"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.network"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.security"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.storage"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.system"
AP64_COLLECTIONS+=" ${AP64_NAMESPACE}.web"

# Paths
declare AP64_PATH_ROOT=''
declare AP64_PATH_VAR=''
declare AP64_PATH_INVENTORY=''
declare AP64_PATH_VENV=''
declare AP64_PATH_VENV_CACHE=''
declare AP64_PATH_VENV_TMP=''

# File names
declare AP64_FILE_ANSIBLE_CONTROL='ansible_control.env'
declare AP64_FILE_ANSIBLE_INVENTORY='aplatform64_service.ini'
declare AP64_FILE_CATALOG='catalog.csv'

# Node bootstrap SSH credentials
export AP64_NODE_USER
export AP64_NODE_PASSWORD

# Current site
declare AP64_SITE_CURRENT=''
