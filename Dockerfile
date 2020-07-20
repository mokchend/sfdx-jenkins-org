FROM salesforce/salesforcedx
RUN echo y | sfdx plugins:install salesforcedx@latest
RUN echo y | sfdx plugins:install @oclif/plugin-autocomplete
RUN sfdx autocomplete
#RUN printf "$(sfdx autocomplete:script bash)" >> ~/.bashrc; source ~/.bashrc

RUN echo 'y' | sfdx plugins:install sfpowerkit

# https://github.com/wadewegner/sfdx-waw-plugin
RUN echo 'y' | sfdx plugins:install sfdx-waw-plugin

# install sgd from npm - https://github.com/scolladon/sfdx-git-delta
RUN npm install sfdx-git-delta@latest --global
RUN sgd --version

# Shane McLaughlin / shane.mclaughlin@salesforce.com - https://github.com/mshanemc/shane-sfdx-plugins 
RUN export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=false && npm install -g shane-sfdx-plugins
RUN echo y | sfdx plugins:install shane-sfdx-plugins


# Latest npm version
RUN npm install -g npm

# Install heroku toolbelt
# https://devcenter.heroku.com/articles/heroku-cli
# RUN npm install -g heroku
RUN curl https://cli-assets.heroku.com/install.sh | sh 


# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME



# Installs Ant to to used with ANT force.com scripts
# 1.10.8 release - requires minimum of Java 8 at runtime
ENV ANT_VERSION 1.10.8
RUN cd && \
    wget -q http://www.us.apache.org/dist//ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mv apache-ant-${ANT_VERSION} /opt/ant && \
    rm apache-ant-${ANT_VERSION}-bin.tar.gz
ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin

# Install the ANT Migration tool - cannot be done here as the folder is not mount when building the image
# /root/tools/sample folder

# Command utils
# Python3 is installed via vim dependency
# python3 -V > Python 3.6.9
# python2 -V > Python 2.7.15+
RUN apt-get install dos2unix 

# Install pip3 for Salesforce Scripting Tools - SFST de Jean Francois
RUN apt-get install -y --no-install-recommends python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
