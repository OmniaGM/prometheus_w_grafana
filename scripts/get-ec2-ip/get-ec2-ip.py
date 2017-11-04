import json
import sys

args = sys.argv[1:]

if len(args) == 0 : 
    print("You need to pass ec2 host name")
    sys.exit(1)

ec2_host_name = args[0]
with open('./scripts/get-ec2-ip/ec2-list.json') as json_data:
    ec2_list = json.load(json_data)
    print(ec2_list[ec2_host_name][0])