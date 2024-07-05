#!/bin/bash

AWS_DIR="/tmp/.aws"
mkdir $AWS_DIR
touch $AWS_DIR/credentials
cat << EOF > $AWS_DIR/credentials
[default]
aws_access_key_id = $1
aws_secret_access_key = $2
aws_session_token = $3
EOF