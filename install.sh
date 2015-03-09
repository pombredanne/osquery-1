#!/bin/bash
set -o errexit
apt-get update
apt-get upgrade -y
apt-get install -y git wget sudo build-essential
git clone https://github.com/facebook/osquery.git
cd /osquery
git checkout 1.0.3
./tools/provision.sh
make
make package
dpkg -i ./build/linux/osquery-0.0.1-trusty.amd64.deb
apt-get purge git wget sudo build-essential
rm -rf /var/lib/apt/lists/*
apt-get autoremove
apt-get clean
cd /
rm -rf /osquery
