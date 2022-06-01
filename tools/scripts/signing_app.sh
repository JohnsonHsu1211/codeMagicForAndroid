#!/usr/bin/env bash
# fail if any commands fails
set -e
# debug log
set -x

# CM_KEYSTORE binary file require encode w/ base64
echo $CM_KEYSTORE | base64 --decode > $CM_KEYSTORE_PATH
touch $CM_BUILD_DIR/keystore.properties
cat >> "$CM_BUILD_DIR/keystore.properties" <<EOF
key.storePassword=$CM_KEYSTORE_PASSWORD
key.keyPassword=$CM_KEY_PASSWORD
key.keyAlias=$CM_KEY_ALIAS
key.storeFile=$CM_KEYSTORE_PATH
EOF
