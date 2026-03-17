#!/bin/bash

# T1-M1-S02: SECURITY HARDENING AUTOMATION
# Task: Restore Gold Standard permissions to restricted artifacts

#Add commands to secure ~/Vault/secrets.txt to 600
chmod 600 ~/Vault/secrets.txt
echo "Applying secure permissions..."

#Add commands to secure /etc/shadow to 640
sudo chmod 640 /etc/shadow
sudo chown root:shadow /etc/shadow

#Lock down your SSH hardening
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
echo "Hardening complete."
