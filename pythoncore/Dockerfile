# Ref: https://gitlab.agilesof.com/cicd/containers-quickstarts/tree/db4e1a16760c5ef3503004e204a230c41d61531d/jenkins-slaves
# https://forums.docker.com/t/using-docker-in-a-dockerized-jenkins-container/322/18
# FROM openshift/jenkins-slave-base-centos7:v3.11

FROM jenkins/jenkins:lts-centos7

USER root

# Update yum packages
RUN yum update -y
# RUN yum install python3.7 -y
RUN yum install gcc openssl-devel bzip2-devel libffi-devel zlib-devel -y
RUN curl https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tgz --output /tmp/Python-3.7.9.tgz
WORKDIR /tmp
RUN tar xzf Python-3.7.9.tgz
WORKDIR /tmp/Python-3.7.9
RUN ./configure --enable-optimizations
RUN yum install make -y
RUN make altinstall
RUN yum install which -y
WORKDIR /tmp
RUN rm -r Python-3.7.9.tgz
RUN yum -y install epel-release
RUN curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
RUN python3.7 get-pip.py
RUN python3.7 -m pip install --upgrade pip
# RUN pip install docker-compose

#skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# installing required plugins
# COPY plugins.txt /usr/share/jenkins/plugins.txt
# RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

USER root

# install docker
RUN yum install -y yum-utils device-mapper-persistent-data lvm2
RUN yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y docker-ce-cli

# install docker compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
# RUN curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    # ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose \
    docker-compose --version

# RUN systemctl start docker
RUN groupadd docker
RUN usermod -aG docker jenkins

#give jenkins user sudoer permission
RUN echo -e "jenkins ALL=(ALL)  NOPASSWD: ALL" >> /etc/sudoers

# give jenkins user sudoers permission
RUN echo -e "jenkins ALL=(ALL)  NOPASSWD: ALL" >> /etc/sudoers.d/jenkins

RUN chmod u+wx /etc/sudoers
USER jenkins
