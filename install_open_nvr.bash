#!/usr/bin/env bash

source ./credentials.bash

mkdir -p recorder log

sudo mkdir -p /opt/open_nvr

sudo cp ./open_nvr.bash /opt/open_nvr/

sudo cp ./open_nvr.service /etc/systemd/system/

sudo systemctl enable open_nvr.service

sudo systemctl start open_nvr.service

ssh-keygen -t rsa

ssh-copy-id ${SERVER_USER}@${SERVER_ADDR}
