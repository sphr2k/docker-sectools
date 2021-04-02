FROM mcr.microsoft.com/powershell:preview-ubuntu-focal
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y --no-install-recommends \
    bash-completion curl wget aria2 software-properties-common ca-certificates \
    nano git net-tools iputils-ping dnsutils gpg python3 python3-pip bsdmainutils

RUN git clone --depth 1 https://github.com/drwetter/testssl.sh.git /opt/testssl \
 && ln -s /opt/testssl/testssl.sh /usr/local/bin/tetssl

RUN pip3 install ssh-audit
