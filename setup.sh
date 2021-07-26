#!/bin/bash

sudo apt-get update
sudo apt-get install -y git unzip


# echo "Installing Docker ..."
curl -fsSL https://get.docker.com -o get-docker.sh
chmod 770 ./get-docker.sh
./get-docker.sh

# echo "Installing JDK  ----"
sudo add-apt-repository ppa:linuxuprising/java
sudo apt-get update
sudo apt install -y oracle-java16-installer
java -version

# echo "Installing Maven ----"
wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
tar xzvf apache-maven-3.8.1-bin.tar.gz
export PATH="$HOME/apache-maven-3.8.1/bin:$PATH"
mvn  -v


# echo "Getting Demo app  ----"
git clone https://github.com/xxradar/testappspringboot.git
cd testappspringboot/
unzip demotest.zip

