FROM "jenkins/jenkins"
USER root

RUN apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs maven && \
    npm install --global sfdx-cli

RUN apt-get update && apt-get install -y tree nano curl sudo
RUN curl https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz | tar xvz -C /tmp/ && mv /tmp/docker/docker /usr/bin/docker
RUN curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod 755 /usr/local/bin/docker-compose
RUN usermod -a -G sudo jenkins
RUN echo "jenkins ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
USER jenkins
# RUN chown -R jenkins:jenkins /mnt/a/data01/jenkins_home/.sfdx/
# RUN ls -ailt /mnt/a/data01/jenkins_home
# RUN chmod 600 /mnt/a/data01/jenkins_home/.sfdx
# VOLUME /mnt/a/data01/jenkins_home/.sfdx
