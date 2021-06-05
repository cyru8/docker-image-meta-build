FROM jenkins/jenkins:lts

USER root
RUN apt-get update -qq && apt-get install -qqy \
apr-transport-https \
curl \
lxc \
iptables

RUN curl -sSL https://get.docker.com/ | sh

CMD dockerd