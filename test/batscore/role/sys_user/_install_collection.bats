setup() {
  . "$TESTMANSH_TEST_BATSCORE_SETUP"
  export _TEST_ANSIBLE_COLLECTIONS_PATH='system'
}

@test "setup: ansible collection for role testing" {
  if [[ ! -d "${HOME}/${_TEST_ANSIBLE_COLLECTIONS_PATH}/${_TEST_ANSIBLE_COLLECTION}/playbooks" ]]; then
    run "${HOME}/${_TEST_ANSIBLE_BIN}/ansible-galaxy" collection install --upgrade ${_TEST_ANSIBLE_NAMESPACE}.${_TEST_ANSIBLE_COLLECTION}
    assert_success
  else
    true
  fi
}
