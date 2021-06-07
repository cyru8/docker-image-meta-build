# Ref: https://gitlab.agilesof.com/cicd/containers-quickstarts/tree/db4e1a16760c5ef3503004e204a230c41d61531d/jenkins-slaves
# https://forums.docker.com/t/using-docker-in-a-dockerized-jenkins-container/322/18
# FROM openshift/jenkins-slave-base-centos7:v3.11

FROM jenkins/jenkins:lts-centos7

# Update yum packages
RUN yum update -y
RUN yum upgrade -y
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


# EXPOSE 8080

# ENV PYTHON_VERSION=3.6 \
#     PATH=$HOME/.local/bin/:$PATH \
#     PYTHONUNBUFFERED=1 \
#     PYTHONIOENCODING=UTF-8 \
#     LC_ALL=en_US.UTF-8 \
#     LANG=en_US.UTF-8 \
#     PIP_NO_CACHE_DIR=off

# RUN INSTALL_PKGS="rh-python36 rh-python36-python-devel rh-python36-python-setuptools rh-python36-python-wheel rh-python36-python-pip nss_wrapper \
#         httpd24 httpd24-httpd-devel httpd24-mod_ssl httpd24-mod_auth_kerb httpd24-mod_ldap \
#         httpd24-mod_session atlas-devel gcc-gfortran libffi-devel libtool-ltdl enchant" && \
#     yum install -y centos-release-scl && \
#     yum -y --setopt=tsflags=nodocs install --enablerepo=centosplus $INSTALL_PKGS && \
#     rpm -V $INSTALL_PKGS && \
#     yum install -y lxc \
#     # Remove centos-logos (httpd dependency) to keep image size smaller.
#     rpm -e --nodeps centos-logos && \
#     yum -y clean all --enablerepo='*' && \
#     source scl_source enable rh-python36 && \
#     scl enable rh-python36 bash && \
#     python3 -m pip install twine
#####added######
# ENV JENKINS_USER admin
# ENV JENKINS_PASS redhat

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
RUN yum install -y docker-ce-cli \
    yum install -y docker-compose

# RUN systemctl start docker
RUN groupadd docker
RUN usermod -aG docker jenkins

#give jenkins user sudoer permission
RUN echo -e "jenkins ALL=(ALL)  NOPASSWD: ALL" >> /etc/sudoers

# give jenkins user sudoers permission
RUN echo -e "jenkins ALL=(ALL)  NOPASSWD: ALL" >> /etc/sudoers.d/jenkins

RUN chmod u+wx /etc/sudoers
USER jenkins

#### end####
# ADD scl_enable /usr/share/container-scripts/
# ENV BASH_ENV=/usr/share/container-scripts/scl_enable \
#     ENV=/usr/share/container-scripts/scl_enable \
#     PROMPT_COMMAND=". /usr/share/container-scripts/scl_enable"

# USER 1001
