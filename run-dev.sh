#!/bin/bash

IP=$(ipconfig getifaddr en0)

./monitoring_config/alertmanager/generater_config_yml.sh
./monitoring_config/prometheus/generater_config_yml.sh $IP

docker-compose -f ./compose/docker-compose.yml -f ./compose/docker-compose-monitor.yml up -d