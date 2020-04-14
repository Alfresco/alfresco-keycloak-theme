#!/bin/bash

OLD_VERSION=$(cat build.properties | grep THEME_VERSION)
OLD_VALUE=$(echo $OLD_VERSION | cut -f 2 -d "=")

NEW_VALUE=$(echo $OLD_VALUE + .1 | bc)

if [[ $NEW_VALUE == .* ]]; then
    # Append zero
    NEW_VALUE="0$NEW_VALUE"
fi

echo "Setting the THEME_VERSION from '$OLD_VALUE' to '$NEW_VALUE'"

NEW_VERSION=$(echo THEME_VERSION=$NEW_VALUE)
sed -i -e "s/$OLD_VERSION/$NEW_VERSION/" build.properties
