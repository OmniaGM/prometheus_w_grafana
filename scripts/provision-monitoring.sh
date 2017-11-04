#!/bin/bash

echo "Generate Alertmanager Config file ..."
./monitoring_config/alertmanager/generater_config_yml.sh

echo "Generate Prometheus Config file ..."
./monitoring_config/prometheus/generater_config_yml.sh $(./scripts/get-ec2-ip/extract-ec2-ip.sh tag_Name_wordpress)

echo "Provisioning Monitoring EC2 ..."
ansible-playbook -i ./ansible/ec2.py --private-key=~/Downloads/demo.pem -v ./ansible/prom.yml