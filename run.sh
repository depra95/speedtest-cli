#!/bin/bash
/usr/bin/docker run -t --rm speedtest-cli:latest --accept-license -s 48463 --format=json | tail -1 