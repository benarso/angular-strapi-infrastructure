#!/usr/bin/env bash
sudo apt-get install apt-transport-dockerhttps ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y
sudo apt-get install python-pip -y
sudo pip install docker-compose
sudo usermod -aG docker vagrant