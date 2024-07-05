#!/bin/bash

mkdir ~/.aws
touch ~/.aws/credentials
cat << EOF > ~/.aws/credentials
[default]
aws_access_key_id = $1
aws_secret_access_key = $2
aws_session_token = $3
EOF