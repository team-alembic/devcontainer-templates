#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

check "asdf installed" which asdf
check "github-cli installed" which gh
check "DATABASE_HOST set" [ -n "$DATABASE_HOST" ]

reportResults
