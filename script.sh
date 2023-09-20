#! /bin/bash
sudo apt update
sudo apt install -y maven
mvn --version
git clone https://github.com/ambareeshns/work.git
pwd
echo "running cd"
cd work
pwd
mvn package
sudo chmod 777 /var/run/docker.sock
docker build -t namdu .
docker run -d -p 9090:8080 namdu
