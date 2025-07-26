setup() {
  . "$TESTMANSH_TEST_BATSCORE_SETUP"
}

@test "ap64: install (-i)" {
  run "$DEV_TESTMANSH_TARGET" -i
  assert_success
}

@test "ap64: install (-l)" {
  run "$DEV_TESTMANSH_TARGET" -l
  assert_success
}

@test "ap64: install (-t)" {
  run "$DEV_TESTMANSH_TARGET" -t
  assert_success
}
