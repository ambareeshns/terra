#! /bin/bash
git clone https://github.com/ambareeshns/work.git
pwd
cd work
pwd
mvn --version
mvn package
sleep 120
sudo chmod 777 /var/run/docker.sock
docker build -t namdu .
sleep 60
docker run -d -p 9090:8080 namdu
