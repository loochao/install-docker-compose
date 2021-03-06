#!/bin/bash

sudo yum update -y

sudo yum install -y netstat git rubygems gcc kernel-devel make perl
sudo yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel maven

sudo gem install sass

cp ./apache-maven-3.3.9-bin.zip /tmp/apache-maven-3.3.9-bin.zip

unzip apache-maven-3.3.9-bin.zip
sudo mv apache-maven-3.3.9 /opt/maven
sudo rm /usr/bin/mvn
ln -s /opt/maven/bin/mvn /usr/bin/mvn


# Install Docker+Docker Compose
tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

sudo yum install -y docker-engine

sudo systemctl start docker

curl -L https://github.com/docker/compose/releases/download/1.6.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version