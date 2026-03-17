#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

check "asdf installed" which asdf
check "claude-code installed" which claude
check "github-cli installed" which gh

reportResults
