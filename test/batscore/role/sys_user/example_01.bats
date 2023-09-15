setup() {
  . "$TESTMANSH_TEST_BATSCORE_SETUP"
  export _TEST_ANSIBLE_COLLECTION='system'
}

@test "sys_user: run example" {
  run "${HOME}/${_TEST_ANSIBLE_BIN}/ansible-playbook" ${HOME}/${_TEST_ANSIBLE_COLLECTIONS_PATH}/${_TEST_ANSIBLE_COLLECTION}/playbooks/sys_user.yml
  assert_success
}
