#!/bin/bash

echo "Provisioning AWS ..."
ansible-playbook -i localhost --private-key=~/Downloads/demo.pem -v ./ansible/aws.yml