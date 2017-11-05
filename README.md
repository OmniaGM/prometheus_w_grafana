## Wordpress + (Prometheus + Grafana) Monitoring

### Deploy

1. You will need to config your aws credentials.
2. You need to setup your op-team email in `./monitoring_config/alertmanager/generater_config_yml.sh`
3. You will need to have a pem file for your keypair from aws. I assumed it's call demo so the file path will be `~/Downloads/dem.pem` .
4. run ` ./scripts/all.sh ` .

This will create 2 EC2 instances (wordpress, prom)

* **wordpress** EC2 contains:
    
    * Wordpress behind Nginx, you can access it from `<WORDPRESS_EC2_IP>`, when you access it first time it will ask you about you blog setup
    
    * MariaDB
    
    * Some Prometheus expoter,
        * [mysql_exporter](https://github.com/prometheus/mysqld_exporter)
        * [node_exporter](https://github.com/prometheus/node_exporter)
        * [blackbox_exporter](https://github.com/prometheus/blackbox_exporter)

* **prom** EC2 contians: 
    
    * Prometheus, you can access prometheus on `<PROM_EC2_IP>:9090`
    
    * Grafana, you can access prometheus on `<PROM_EC2_IP>:3000`. 
    
        > *NOTES:* 
        >
        >    - Use the default Grafana credentials which admin/admin. 
        >
        >    - You will need to create datasource call `prometheus` with type `Prometheus` on URL `<PROM_EC2_IP>:9090` and access `direct`.
    
    * AlertManager, which will send an email to your operation team if prometheus fire an alart

As you see here this chart explain more how it looks like

![Infra Structure](https://www.lucidchart.com/publicSegments/view/8b13fa5d-eac5-4581-b240-fc7def4f913c/image.jpeg)


### Local Run
To run the whole system on you local machine just run this command `./run-dev.sh`

* **Nginx** [localhost](localhost)

* **Prometheus** [localhost:9090](localhost:9090)

* **Grafana** [localhost:3000](localhost:3000)

