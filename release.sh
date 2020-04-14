#!/bin/bash -e

set -o errexit

declare -r currentDir="$(dirname "${BASH_SOURCE[0]}")"
source "${currentDir}/build.properties"

CURRENT_BRANCH=$(git branch | grep '*' | cut -d' ' -f 2)

echo "Do you wish to tag and push the current branch '$CURRENT_BRANCH' as '$THEME_VERSION' ?"
select yn in "Yes" "No"; do
    case $yn in
    Yes)
        git tag "$THEME_VERSION" -m ""
        git push origin "$THEME_VERSION"
        break
        ;;
    No)
        exit
        ;;
    esac
done