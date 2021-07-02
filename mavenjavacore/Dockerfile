FROM jenkins/jenkins:lts
# if we want to install via apt
USER root
RUN apt-get update && apt-get install -y maven
# drop back to the regular jenkins user - good practice
USER jenkins

# FROM jenkins/ssh-slave

# # Install selected extensions and other stuff
# RUN apt-get update && apt-get -y --no-install-recommends install && apt-get clean
# RUN apt-get install -y curl 

# ARG MAVEN_VERSION=3.6.2
# ARG USER_HOME_DIR="/usr/jenkins"
# ARG SHA=d941423d115cd021514bfd06c453658b1b3e39e6240969caf4315ab7119a77299713f14b620fb2571a264f8dff2473d8af3cb47b05acf0036fc2553199a5c1ee
# ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

# RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
#   && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
#   && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha512sum -c - \
#   && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
#   && rm -f /tmp/apache-maven.tar.gz \
#   && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# ENV MAVEN_HOME /usr/share/maven
# ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

# RUN chown -R jenkins:jenkins /home/jenkins &&  chmod -R 777 /home/jenkins
# COPY --chown=jenkins:jenkins ./settings.xml /home/jenkins/.m2/settings.xml
