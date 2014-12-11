#!/bin.bash
cd /root/sflphone/daemon
./autogen.sh
./configure --disable-video
make -j
