FROM "jenkins/jenkins"
USER root

RUN apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs maven && \
    npm install --global sfdx-cli

# RUN chown -R jenkins:jenkins /mnt/a/data01/jenkins_home/.sfdx/
RUN ls -ailt /mnt/a/data01/jenkins_home
RUN chmod 600 /mnt/a/data01/jenkins_home/.sfdx
VOLUME /mnt/a/data01/jenkins_home/.sfdx

USER jenkins