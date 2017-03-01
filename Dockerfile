FROM ubuntu

LABEL maintainer "git@brennancheung.com"

RUN apt-get update && apt-get install -y man dnsutils curl git make vim

ENTRYPOINT ["/bin/sh", "-c", "while true; do sleep 1; done"]
