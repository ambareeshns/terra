#! /bin/bash
git clone https://github.com/ambareeshns/work.git
pwd
cd work
sudo mvn package
sudo chmod 777 /var/run/docker.sock
docker build -t namdu .
