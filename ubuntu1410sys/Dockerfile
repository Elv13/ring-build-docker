FROM ubuntu:14.10

MAINTAINER Emmanuel Lepage version: 0.1

RUN apt-get update && apt-get install git -y

# Do this first to avoir having to clone everytime a change is made
RUN git clone https://gerrit-sflphone.savoirfairelinux.com/sflphone /root/sflphone

# Install Ring using the system packages
RUN apt-get update && apt-get install software-properties-common curl wget yasm libyaml-cpp-dev libpjproject-dev -y && add-apt-repository ppa:savoirfairelinux/sflphone-nightly -y && apt-get update && apt-get build-dep  sflphone-gnome sflphone-daemon -y

RUN mkdir /mnt/ram -p 
RUN apt-get install openssh-server -y
RUN cd /mnt/ram

# Uncomment to check if the image is able to compile Ring
ADD compile.sh /root/compile.sh
RUN /bin/bash /root/compile.sh

CMD ["/bin/bash/", "-c", "/root/setupenv.sh"]
