setup() {
  . "$TESTMANSH_TEST_BATSCORE_SETUP"
}

@test "ap64: install (-i)" {
  run "$DEVAP_TESTMANSH_TARGET" -i
  assert_success
}
