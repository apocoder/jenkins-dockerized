FROM jenkins/jenkins:2.150
LABEL maintainer="apocoder@gmail.com"

# Prep Jenkins Directories
USER root
RUN apt-get update && apt-get install -y python-pip
RUN pip install awscli
# prerequisites for docker
RUN apt-get update \
    && apt-get -y install \
        apt-transport-https \
        ca-certificates \
        mysql-client \
        curl \
        build-essential \
        software-properties-common



        RUN apt-get update && \
        apt-get -y install apt-transport-https \
             ca-certificates \
             curl \
             gnupg2 \
             software-properties-common && \
        curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
        add-apt-repository \
           "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
           $(lsb_release -cs) \
           stable" && \
        apt-get update && \
        apt-get -y install docker-ce

# Using Ubuntu
RUN curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN npm install -g newman

# docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# give jenkins docker rights
RUN usermod -aG docker jenkins

RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER root

# Set Defaults
ENV JAVA_OPTS="-Xmx8192m"
ENV JENKINS_OPTS="--handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log  --webroot=/var/cache/jenkins/war"
