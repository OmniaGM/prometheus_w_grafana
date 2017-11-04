#!/bin/bash

echo "Provisioning Wordpress EC2 ..."
 ansible-playbook -i ./ansible/ec2.py --private-key=~/Downloads/demo.pem -v ./ansible/wp.yml