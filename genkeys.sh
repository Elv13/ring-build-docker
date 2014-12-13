#!/bin/bash
# This script generate RSA keys pairs for each containers templates
# It need to be run only once if containers are re-used

for containers in $(find ./ -maxdepth 1 -type d  | grep -E './[a-z]+' | cut -f2 -d'/'); do
    cp known_host $containers
    echo GEN FOR  $containers
    cd $containers
    ssh-keygen -f ./id_rsa -P ""
    cd ..
done
