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
declare AP64_ROOT=''
declare AP64_VAR=''
declare AP64_INVENTORY=''

# A:Platform64 node bootstrap SSH credentials
export AP64_NODE_USER
export AP64_NODE_PASSWORD
