#!/bin/sh

if [ -z "$1" ]
  then
    echo "No new version are provided"
    exit 1
fi

if [ -f VERSION ]
  then
    echo "Could not find a VERSION file"
    exit 1
fi


if [ -f CHANGELOG ]
  then
    echo "Could not find a CHANGELOG file"
    exit 1
fi

CURRENT_VERSION=`cat VERSION`
NEW_VERSION="$1"
echo "Current version : $CURRENT_VERSION"
echo "New version : $NEW_VERSION"
exit 1

echo "Will set new version to be $NEW_VERSION"
echo $NEW_VERSION > VERSION
echo "Version $NEW_VERSION:" > tmpfile
git log --pretty=format:" - %s" "v$CURRENT_VERSION"...HEAD >> tmpfile
echo "" >> tmpfile
echo "" >> tmpfile
cat CHANGELOG >> tmpfile
mv tmpfile CHANGELOG
#git add CHANGELOG VERSION