#! /bin/bash
sudo apt install -y maven
sleep 120
mvn --version
git clone https://github.com/ambareeshns/work.git
pwd
echo "running cd"
cd work
pwd
mvn package
sleep 120
sudo chmod 777 /var/run/docker.sock
docker build -t namdu .
sleep 60
docker run -d -p 9090:8080 namdu
