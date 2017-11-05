#!/bin/bash

IP=$1
cat <<EOF > monitoring_config/prometheus/prometheus.yml
global:
  scrape_interval: 15s
  external_labels:
    monitor: 'blog'

rule_files:
  - "alert.rules"
scrape_configs:
  - job_name: linux
    static_configs:
      - targets: ['$IP:9100']

  - job_name: 'website'
    metrics_path: /probe
    params:
      module: [http_2xx, http_post_2xx, http_4xx_5xx, debug=true]
    static_configs:
      - targets: ['$IP:8080']
    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target]
        target_label: instance
      - target_label: __address__
        replacement: '$IP:9115' 

  - job_name: 'docker cAdvisor'
    scrape_interval: 10s
    scrape_timeout: 5s
    static_configs:
      - targets: ['$IP:8088']

  - job_name: 'mysql global status'
    scrape_interval: 15s
    static_configs:
      - targets: ['$IP:9104']

    params:
      collect[]:
        - global_status
  
  - job_name: 'mysql performance'
    scrape_interval: 1m
    static_configs:
      - targets: ['$IP:9104']
    params:
      collect[]:
        - perf_schema.tableiowaits
        - perf_schema.indexiowaits
        - perf_schema.tablelocks
  
  - job_name: 'nginx state'
    scrape_interval: 15s
    static_configs:
      - targets: ['$IP:9113']
      
  - job_name: "EC2 Metrics"
    scrape_interval: 15s
    static_configs:
      - targets: ['$IP:9222']
EOF