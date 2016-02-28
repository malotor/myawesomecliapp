#!/bin/sh

PHAR_NAME="myawesomecliapp"
DESTINATION_PATH="/Users/manel/Projects/github_pages/malotor.github.io/myawesomecliapp"
REPO_URL="http://mattketmo.github.io/myawesomecliapp/downloads"

CURRENT_VERSION=`cat VERSION`
PHAR_FILE="${PHAR_NAME}.phar"

# Build phar file
./box.phar build
# Calculate the hash

HASH=`openssl sha1 ${PHAR_FILE} | awk '{print $2}'`
NEW_PHAR_FILE="${PHAR_NAME}-${CURRENT_VERSION}.phar"
echo "Current version: ${CURRENT_VERSION}"
echo "New file: ${NEW_PHAR_FILE}"
echo "Hash: ${HASH}"

# Move file to destination downloads folder
mv ${PHAR_NAME}.phar ${DESTINATION_PATH}/downloads/${NEW_PHAR_FILE}
# Update manifest
MANIFEST="[{\"name\":\"${PHAR_NAME}.phar\",\"sha1\":\"${HASH}\",\"url\":\"${REPO_URL}/${NEW_PHAR_FILE}\",\"version\":\"${CURRENT_VERSION}\"}]"
echo $MANIFEST > $DESTINATION_PATH/manifest.json