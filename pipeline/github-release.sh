#!/bin/bash


# Check for an existing release for this tag
_check_existing() {

    if gh release list -R "$_repo" | awk '{ print $1 }' | grep ^"$_tag"$ ; then
        return 1
    fi
}


# Create a new release
_create_release() {

    gh release create \
        -R "$_repo" "$_tag" \
        --title "$_tag" \
        --notes "Automated release." || return 1

    _upload_assets || return 1
}


# Main function
_main() {

    _repo="${GITLAB_USER_LOGIN:?}/${CI_PROJECT_NAME:?}"
    _tag="${CI_COMMIT_TAG:?}"

    # Check GitHub authentication status
    gh auth status || return 1

    # Check repository authentication status
    if ! gh release list -R "$_repo" > /dev/null 2>&1 ; then
        printf "ERROR: Could not stat releases for repository '%s'\n" "$_repo"
        return 1
    fi

    # Source release assets
    # shellcheck source=SCRIPTDIR/release-assets.sh
    source pipeline/release-assets.sh || return 1

    # Check for existing releases, and create a new one
    if _check_existing ; then
        _create_release || return 1
    else
        printf "WARNING: Tagged release already exists. Skipping.\n"
    fi
}


# Upload the release assets
_upload_assets() {

    if ! gh release upload -R "$_repo" "$_tag" "${release_assets[@]}" ; then
        return 1
    fi
}


if ! _main "$@" ; then
    exit 1
fi
