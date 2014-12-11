#!/bin/bash

cd /root/sflphone/
git reset --hard
git pull --rebase
mkdir daemon/contrib/native
echo PWD $PWD
cd daemon/contrib/native
../bootstrap
make 
exit 0
