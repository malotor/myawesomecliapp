#!/bin/sh

if [ -z "$1" ]
  then
    echo "No new version are provided"
    exit 1
fi

if [ ! -f VERSION ]
  then
    echo "Could not find a VERSION file. Creating one."
    touch VERSION
fi


if [ ! -f CHANGELOG ]
  then
    echo "Could not find a CHANGELOG file. Creating one."
    touch CHANGELOG
fi

CURRENT_VERSION=`cat VERSION`
NEW_VERSION="$1"
DATE=`date +"%Y-%m-%d"`

if ! git show-ref --tags | egrep -q "refs/tags/${CURRENT_VERSION}$"
then
    echo "Current version tag '${CURRENT_VERSION}' not found"
    exit 1
fi

echo "Current version : $CURRENT_VERSION"
echo "New version : $NEW_VERSION"

echo "v$NEW_VERSION ($DATE)" > tmpfile
echo "-------------------" >> tmpfile
git log --no-merges --pretty=format:" * %s" "$CURRENT_VERSION"...HEAD >> tmpfile
echo "" >> tmpfile
echo "" >> tmpfile
cat CHANGELOG >> tmpfile

echo "CHANGELOG:"
more tmpfile

read -p "Do you want to continue? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "VERSION set to $NEW_VERSION"
    echo $NEW_VERSION > VERSION
    mv tmpfile CHANGELOG
    echo "CHANGELOG updated!"
    git add VERSION CHANGELOG
    git commit -m "VERSION ${NEW_VERSION}"
    echo "Commit created!"
fi

rm -f tmpfile
