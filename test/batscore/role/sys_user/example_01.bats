setup() {
  . "$TESTMANSH_TEST_BATSCORE_SETUP"
  sudo -i -u ansible-2.13 ansible-galaxy collection install --upgrade serdigital64.system
}

@test "ap64: no args" {
  run sudo -i -u ansible-2.13 ansible-playbook /opt/ansible-2.13/.ansible/collections/ansible_collections/serdigital64/system/playbooks/sys_user.yml
  assert_success
}
