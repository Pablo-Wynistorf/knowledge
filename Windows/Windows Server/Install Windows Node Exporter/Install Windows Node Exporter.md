1.) Download a suitable version of the node exporter from this link:

[https://github.com/prometheus-community/windows_exporter/releases](https://github.com/prometheus-community/windows_exporter/releases)

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/FgzXtoTwmZ1fzijjIgVOdtDY.png)

2.) Run the MSI and check, if it starts automatically. For that, open services:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/MdC_TCOCAA_Bp2HyMuGkl49j.png)

Right click and open the properties.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/87lXmSw6A49pcIquqLg3re8g.png)

It should look like this. Go to: [http://localhost:9182](http://localhost:9182) to check the exporter is running as expected.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/THkeOZs82AaavCUx6bMiIl9K.png)





3.) If so, install prometheus on the same host, or a host in the same network. I recommend using a ubuntu server.

On a Ubuntu server:

```
apt update
apt install prometheus -y
```

4.) Now you have to add the node exporter as a job in the prometheus config file:

```
nano /etc/prometheus/prometheus.yml
```

The file should look like this.

```yaml
# Sample config for Prometheus.

global:
  scrape_interval:     15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
  # scrape_timeout is set to the global default (10s).

  # Attach these labels to any time series or alerts when communicating with
  # external systems (federation, remote storage, Alertmanager).
  external_labels:
      monitor: 'example'

# Alertmanager configuration
alerting:
  alertmanagers:
  - static_configs:
    - targets: ['localhost:9093']

# Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
rule_files:
  # - "first_rules.yml"
  # - "second_rules.yml"

# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: 'prometheus'

    # Override the global default and scrape targets from this job every 5 seconds.
    scrape_interval: 5s
    scrape_timeout: 5s

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
      - targets: ['localhost:9090']

  - job_name: node
    # If prometheus-node-exporter is installed, grab stats about the local
    # machine by default.
    static_configs:
      - targets: ['localhost:9100']
```

6.) Add these lines at the end of the config file and replace the variables with your information:

```yaml
  - job_name: '$Job-Name'
    scrape_interval: 5s
    static_configs:
      - targets: ['$Windows-Server-IP:9182']
```

After that, save the file and restart prometheus:

```yaml
service prometheus restart
```

7.) Check if the windows server is now added to the prometheus service. To do so, go to: [http://$prometheus-server-ip:9090/classic/targets](http://$prometheus-server-ip:9090/classic/targets)

It should look like this:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/q0chwpN3MTPhkdUIoFMmHOtB.png)



8.) Now you can add the prometheus server as datasource in grafana.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/SIa_Ha2AmRMThLFnA7dfw362.png)

9.) Now you can import a Windows Exporter Dashboard:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/TJXUIOjBdL4JN-bNRJkgsmhJ.png)

10.) It should look something like this:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/_9YLtMCuGb8mXrKam4-h3xFa.png)
