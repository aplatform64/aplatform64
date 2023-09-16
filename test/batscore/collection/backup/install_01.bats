setup() {
  . "$TESTMANSH_TEST_BATSCORE_SETUP"
  export _TEST_ANSIBLE_COLLECTION='backup'
}

@test "backup: install" {
  run "${HOME}/${_TEST_ANSIBLE_BIN}/ansible-galaxy" collection install --upgrade ${_TEST_ANSIBLE_NAMESPACE}.${_TEST_ANSIBLE_COLLECTION}
  assert_success
}
'
