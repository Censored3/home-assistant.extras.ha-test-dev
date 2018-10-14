FROM debian:latest

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install apt-utils && \
    apt-get -y install python3 python3-dev python3-pip tox \
                               build-essential \
                               git && \
    apt-get clean && apt-get autoclean && \
    rm -rf /var/lib/apt/lists && \
    cd /root && git clone https://github.com/Censored3/home-assistant && \

    cd /root/home-assistant && \
        git remote add upstream https://github.com/home-assistant/home-assistant.git && \
        git checkout censored-dev


CMD cd /root/home-assistant && git fetch && git reset --hard origin/censored-dev && tox -r
