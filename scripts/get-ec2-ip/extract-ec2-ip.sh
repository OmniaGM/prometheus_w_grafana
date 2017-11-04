#!/bin/bash

python ./ansible/ec2.py --list > ./scripts/get-ec2-ip/ec2-list.json &&
python ./scripts/get-ec2-ip/get-ec2-ip.py $1