FROM jenkins/jenkins:lts

USER root
RUN apt-get update -qq && apt-get install -qqy \
apt-transport-https \
curl \
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
sudo chmod +x /usr/local/bin/docker-compose \
lxc \
iptables

RUN curl -sSL https://get.docker.com/ | sh

CMD dockerd