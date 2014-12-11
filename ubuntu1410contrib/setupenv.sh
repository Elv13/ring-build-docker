mount -t tmpfs -o size=2048m tmpfs /mnt/ram/
cd /root/daemon
git pull --rebase
cp -a /root/daemon /mnt/ram
