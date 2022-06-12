#!/bin/bash
# shellcheck disable=SC2034
release_assets=( \
    "proton-shunt.cfg" \
    "build/proton-shunt-$CI_COMMIT_TAG.exe" \
)
