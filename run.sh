#!/bin/bash
docker run -it --rm speedtest-cli:latest --accept-license -s 48463 --format=json  | tail -1 |tee -a result.log