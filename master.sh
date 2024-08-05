#!/bin/bash
sudo docker swarm init --advertise-addr=19.16.24.320
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh