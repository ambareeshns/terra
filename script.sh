#! /bin/bash
sudo apt update
sudo apt install -y maven
git clone https://github.com/ambareeshns/work.git
cd work
mvn package
sudo chmod 777 /var/run/docker.sock
docker build -t namdu .
docker run -d -p 9090:8080 namdu
