FROM fedora:latest

MAINTAINER Emmanuel Lepage version: 0.1

#Install Ring using the contrib system
RUN yum update -y 

RUN yum install  -y curl
RUN curl https://projects.savoirfairelinux.com/projects/sflphone/repository/revisions/master/raw/tools/build-system/rpm/sflphone.spec | grep BuildRequires | cut -f2 -d':' | grep -E "^ " | xargs yum install -y
RUN mkdir /mnt/ram -p 


RUN yum install git -y

# Do this first to avoir having to clone everytime a change is made
RUN git clone https://gerrit-sflphone.savoirfairelinux.com/sflphone /root/sflphone

RUN yum install gcc-c++ -y

RUN yum localinstall -y --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

RUN yum install ffmpeg-devel -y

# Uncomment to check if the image is able to compile Ring
ADD compile.sh /root/compile.sh
RUN /bin/bash /root/compile.sh

CMD ["/bin/bash/", "/root/setupenv.sh"]
