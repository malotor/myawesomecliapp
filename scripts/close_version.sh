#!/bin/sh

if [ ! -f VERSION ]
  then
    echo "Could not find a VERSION file."
fi


CURRENT_VERSION=`cat VERSION`

git tag -a $CURRENT_VERSION -m "VERSION ${CURRENT_VERSION}"