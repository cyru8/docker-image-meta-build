#REf: https://github.com/cn-docker/jenkins-slave-nodejs/blob/main/Dockerfile
#     https://hub.docker.com/r/cnservices/jenkins-slave-nodejs
#FROM node:alpine
FROM jenkins/ssh-slave
LABEL maintainer="Cyru8 <cyru8@techinit.int>"

RUN apt-get update && apt-get -y --no-install-recommends install && apt-get clean
RUN apt-get install -y curl 

RUN apt add --no-cache git subversion mercurial wget unzip openssh ca-certificates procps bash openjdk8 && \
    rm -rf /var/cache/apt/*

# Install nodejs    
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs && apt-get install -y nginx

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $JAVA_HOME/bin:$JAVA_HOME/lib:$PATH

RUN addgroup -S -g 10000 jenkins && \
    adduser -S -u 10000 -h /home/jenkins -G jenkins jenkins

USER jenkins
WORKDIR /home/jenkins

CMD ["/bin/sh"]

