FROM ubuntu:22.04
RUN apt-get update
RUN apt-get -y install curl 
RUN curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash
RUN apt-get -y install speedtest
ENTRYPOINT [ "speedtest"] 