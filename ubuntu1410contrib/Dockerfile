#Install Ring using the contrib system
FROM ubuntu:14.10

MAINTAINER Emmanuel Lepage version: 0.1

RUN apt-get update && apt-get install git -y

# Do this first to avoir having to clone everytime a change is made
RUN git clone https://gerrit-sflphone.savoirfairelinux.com/sflphone /root/sflphone

# Install the necessary packages
RUN apt-get install software-properties-common yasm build-essential curl wget autoconf autotools-dev libtool cmake autopoint pkg-config texinfo libx11-xcb-dev libasound2-dev libpulse-dev -y

# Create the ramdisk path
RUN mkdir /mnt/ram -p 

# The "genkeys.sh" script need to be executed first
RUN adduser jenkins --gecos "" --disabled-password
RUN mkdir /home/jenkins/.ssh/
ADD known_hosts /home/jenkins/.ssh/
ADD id_rsa /home/jenkins/.ssh/
ADD id_rsa.pub /home/jenkins/.ssh/
RUN chown jenkins:jenkins /home/jenkins/.ssh/*
RUN chown 600 /home/jenkins/.ssh/*

# Install openssh-server (for Jenkins and debug)

RUN apt-get install openssh-server -y

ADD bootstrap.sh /root/

RUN /bin/bash /root/bootstrap.sh

# Uncomment to check if the image is able to compile Ring
ADD compile.sh /root/compile.sh
RUN /bin/bash /root/compile.sh

CMD ["/bin/bash/", "/root/setupenv.sh"]
