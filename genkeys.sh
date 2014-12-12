#!/bin/bash
# This script generate RSA keys pairs for each containers templates
# It need to be run only once if containers are re-used

for containers in $(ls); do
    cp known_host $containers
    cd $containers
    ssh-keygen -f ./id_rsa -P ""
    cd ..
done
