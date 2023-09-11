setup() {
  . "$TESTMANSH_TEST_BATSCORE_SETUP"
}

@test "ap64: no args" {
  run "$DEV_TESTMANSH_TARGET"
  assert_failure
}

@test "ap64: cmd -h" {
  run "$DEV_TESTMANSH_TARGET" -h
  assert_success
}
