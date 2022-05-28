setup() {
  . "$TESTMANSH_TEST_BATSCORE_SETUP"
}

@test "hello_world: basic test" {
  run true
  assert_success
}
