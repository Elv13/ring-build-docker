#!/bin.bash
cd /root/sflphone/daemon
./autogen.sh
./configure
make -j
