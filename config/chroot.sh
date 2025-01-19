#!/bin/sh
USERNAME="ubuntu"
PASSWORD="123456"
/debootstrap/debootstrap --second-stage
echo "locales locales/default_environment_locale select en_US.UTF-8" | debconf-set-selections
echo "locales locales/locales_to_be_generated multiselect en_US.UTF-8 UTF-8" | debconf-set-selections
rm "/etc/locale.gen"
dpkg-reconfigure --frontend noninteractive locales
dpkg -i root/*.deb
apt update
apt install usbutils network-manager sudo fdisk vim nano openssh-server iputils-ping wget curl iproute2 locales kmod zip unzip u-boot-tools initramfs-tools net-tools htop -y
echo -e "$PASSWORD\n$PASSWORD" | adduser --gecos "" $USERNAME
usermod -aG sudo $USERNAME
exit
