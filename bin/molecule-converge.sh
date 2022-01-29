#!/bin/bash

set -x

MOLECULE_BIN="$APLATFORM64_VEW_WORKSPACE_BIN/molecule"

test="$1"

[[ -z "$test" ]] && exit 1
[[ -x "$MOLECULE_BIN" ]] || exit 1

"$MOLECULE_BIN" destroy -s "$test"

"$MOLECULE_BIN" --debug converge -s "$test"
