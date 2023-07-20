# speedtest-cli

This is a Docker image that generates and runs speedtest CLI.

## Usage
Execute `build.sh` to build the Docker image.

In the sample provided by `run.sh`, speedtest will be executed against the IPA CyberLab 400G (48463) server with the agreement to Speedtest CLI's license, and the results will be output in JSON format.  
The arguments such as the target server and output format used in `run.sh` follow the Speedtest CLI documentation. Please edit the settings accordingly before using.
```
$ ./run.sh
{"type":"result","timestamp":"2023-07-20T14:18:49Z","ping":{"jitter":0.517,"latency":2.546,"low":2.260,"high":3.375},"download":{"bandwidth":112015788,"bytes":562330489,"elapsed":5008,"latency":{"iqm":9.592,"low":2.901,"high":13.704,"jitter":0.958}},"upload":{"bandwidth":105969570,"bytes":758185707,"elapsed":7209,"latency":{"iqm":8.617,"low":2.073,"high":20.015,"jitter":3.557}},"packetLoss":0,"isp":"VECTANT","interface":{"internalIp":"172.17.0.2","name":"eth0","macAddr":"02:42:AC:11:00:02","isVpn":false,"externalIp":""},"server":{"id":48463,"host":"speed.udx.icscoe.jp","port":8080,"name":"IPA CyberLab 400G","location":"Tokyo","country":"Japan","ip":""},"result":{"id":"2954b6df-21b1-416f-b1fa-9f3965ae7d28","url":"https://www.speedtest.net/result/c/2954b6df-21b1-416f-b1fa-9f3965ae7d28","persisted":true}}
```

### Simple Logging
`log.sh` writes data in JSON format to `./result.log`.  
The content of this shell script also follows the Speedtest CLI documentation regarding target server and output format. Please edit the settings accordingly before using.
```
$ ./log.sh
```

### Other Samples
Sample to record `run.sh` output in syslog
```
./run.sh | logger -t speedtest-cli
```

Sample to record `run.sh` output in syslog every hour using cron
```
0 * * * * /path/to/speedtest-cli/run.sh | /usr/bin/logger -t speedtest-cli
```

Sample to write `result.log` in the destination directory every hour using cron
```
0 * * * * cd /path/to/speedtest-cli && /path/to/speedtest-cli/log.sh
```