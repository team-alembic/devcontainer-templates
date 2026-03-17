#!/bin/bash

FAILED=()

echoStderr()
{
    echo "$@" 1>&2
}

check() {
    LABEL=$1
    shift
    echo -e "\nTesting $LABEL"
    if "$@"; then
        echo "Passed!"
        return 0
    else
        echoStderr "$LABEL check failed."
        FAILED+=("$LABEL")
        return 1
    fi
}

reportResults() {
    if [ ${#FAILED[@]} -ne 0 ]; then
        echoStderr -e "\nFailed tests: ${FAILED[@]}"
        exit 1
    else
        echo -e "\nAll passed!"
        exit 0
    fi
}
