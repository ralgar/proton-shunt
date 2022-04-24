#!/bin/sh

_main() {

    if ! xvfb-run -a \
        wine64 proton-shunt.exe \
        arg1 \
        --arg2 \
        "https://arg3.tld/api/v1/endpoint?user_id=1234&file=5678" \
        "arg 4" \
        | grep "Test successful\!"
    then
        return 1
    fi
}

if ! _main ; then
    exit 1
fi
