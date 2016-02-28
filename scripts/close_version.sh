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


CURRENT_VERSION=`cat VERSION`
NEW_VERSION="$1"

git tag -a $CURRENT_VERSION -m "VERSION ${CURRENT_VERSION}"