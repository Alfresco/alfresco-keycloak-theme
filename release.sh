#!/bin/bash

# Available parameters:
# - token
# - prerelease
#
# Example:
# release.sh token=0123456 prerelease=true
#

set -o errexit

declare -r currentDir="$(dirname "${BASH_SOURCE[0]}")"
source "${currentDir}/build.properties"

log_info() {
    echo "info::: $1"
}

log_error() {
    echo "error::: $1"
    exit 1
}

ARGS=$@
for arg in $ARGS; do
    eval "$arg"
done

REPO_URL="https://api.github.com/repos/Alfresco/alfresco-keycloak-theme"
RELEASES_URL="$REPO_URL/releases"
TAGS_URL="$REPO_URL/releases/tags/$THEME_VERSION"
TOKEN="$token"
PRE_RELEASE="${prerelease:-false}"
DISTRIBUTION_NAME="alfresco-keycloak-theme-$THEME_VERSION.zip"

if [ ! -f "$DISTRIBUTION_NAME" ]; then
    log_error "$DISTRIBUTION_NAME does not exist."
fi

log_info "Tag the current branch as $THEME_VERSION"
git tag "$THEME_VERSION"

# check credentials
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" $REPO_URL -H "Authorization: token $TOKEN")
if [ $STATUS_CODE -eq "401" ] || [ $STATUS_CODE -eq "404" ]; then
    log_error "Bad credentials. Status Code: $STATUS_CODE"
fi

log_info "Create $THEME_VERSION release..."
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$RELEASES_URL" -H "Authorization: token $TOKEN" \
    -H 'Content-Type: application/json' \
    -d "{
  \"tag_name\": \"$THEME_VERSION\",
  \"name\": \"$THEME_VERSION\",
  \"draft\": false,
  \"prerelease\": $PRE_RELEASE
}")

if [ $STATUS_CODE -eq "201" ]; then
    log_info "$THEME_VERSION has been released successfully."
else
    log_error "Couldn't release $THEME_VERSION. Status Code: $STATUS_CODE"
fi

WAIT_COUNTER=0
WAIT_COUNTER_MAX=10
WAIT_SLEEP_SECONDS=2
while [ "$WAIT_COUNTER" -lt "$WAIT_COUNTER_MAX" ]; do
    STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$TAGS_URL" -H "Authorization: token $TOKEN")
    if [ $STATUS_CODE -eq "200" ]; then
        log_info "$THEME_VERSION release has been published."
        break
    fi
    log_info "Waiting for $THEME_VERSION release to be published..."
    WAIT_COUNTER=$((WAIT_COUNTER + 1))
    sleep "$WAIT_SLEEP_SECONDS"
    continue
done

# Get upload_url
log_info "Getting upload asset URL from: $TAGS_URL"
UPLOAD_URL=$(curl -s "$TAGS_URL" -H "Authorization: token $TOKEN" | grep upload_url | sed 's/"upload_url":// ; s/"//g' | cut -d'{' -f 1 | tr -d '[:space:]')

log_info "Upload asset URL is: '$UPLOAD_URL'"

if [ -z "$UPLOAD_URL" ]; then
    log_error "upload_url is not found."
fi

log_info "Uploading '$DISTRIBUTION_NAME' asset... "

# Add asset name to the URL
UPLOAD_ASSET_URL="$UPLOAD_URL?name=$(basename $DISTRIBUTION_NAME)"
# Upload asset
curl $UPLOAD_ASSET_URL -H "Authorization: token $TOKEN" -H "Content-Type: application/octet-stream" --data-binary @"$DISTRIBUTION_NAME"
