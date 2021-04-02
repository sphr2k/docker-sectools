#FROM mcr.microsoft.com/powershell:preview-ubuntu-focal
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y wget apt-transport-https software-properties-common \
 && wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb \
 && dpkg -i packages-microsoft-prod.deb \
 && rm packages-microsoft-prod.deb \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    bash-completion curl wget aria2 software-properties-common ca-certificates \
    nano git net-tools iputils-ping dnsutils gpg python3 python3-pip bsdmainutils \
    powershell

RUN git clone --depth 1 https://github.com/drwetter/testssl.sh.git /opt/testssl \
 && ln -s /opt/testssl/testssl.sh /usr/local/bin/tetssl

RUN pip3 install ssh-audit
