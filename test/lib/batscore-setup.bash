#
# Initialize bats-core test
#
# * Source this file from the first line of the setup() function in the test-case
#

. "$TESTMANSH_CMD_BATS_HELPER_SUPPORT"
. "$TESTMANSH_CMD_BATS_HELPER_ASSERT"
. "$TESTMANSH_CMD_BATS_HELPER_FILE"

# Do not overwrite signals already set by bats-core
# ERR, DEBUG, EXIT

# Sets used by bats-core. Do not overwrite
set -o 'errexit'
set +o 'nounset'
# Do not set/unset: 'keyword', 'noexec'

# (Optional) Add shared settings. Available to all test-cases using this setup routine
export DEVAP_TESTMANSH_TARGET="${TESTMANSH_PROJECT_BUILD}/ap64"
