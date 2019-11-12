#!/bin/bash
set -o errexit

declare -r currentDir="$(dirname "${BASH_SOURCE[0]}")"
source "${currentDir}/build.properties"

DISTRIBUTION_NAME=alfresco-keycloak-theme-$THEME_VERSION

# prepare and zip the them content
echo "info::: Removing an existing '$DISTRIBUTION_NAME.zip' file."
rm -rf $DISTRIBUTION_NAME.zip

mkdir alfresco
echo "info::: Packaging alfresco theme as '$DISTRIBUTION_NAME.zip'"

cp -rf theme/* alfresco/
zip -r $DISTRIBUTION_NAME.zip alfresco

echo "info::: Cleanup temp files and folders."
rm -rf alfresco
