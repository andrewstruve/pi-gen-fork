#!/bin/bash -e

echo "Adding autologin"
on_chroot << EOF
    systemctl --quiet set-default graphical.target
EOF
echo "[Service]" > "${ROOTFS_DIR}/etc/systemd/system/getty@tty1.service.d/autologin.conf" 
echo "ExecStart=" >> "${ROOTFS_DIR}/etc/systemd/system/getty@tty1.service.d/autologin.conf" 
echo "ExecStart=-/sbin/agetty --autologin ${FIRST_USER_NAME} --noclear %I \$TERM" >> "${ROOTFS_DIR}/etc/systemd/system/getty@tty1.service.d/autologin.conf" 
echo "\n" >> "${ROOTFS_DIR}/etc/systemd/system/getty@tty1.service.d/autologin.conf"  
sed "${ROOTFS_DIR}/etc/lightdm/lightdm.conf" -i -e "s/^\(#\|\)autologin-user=.*/autologin-user=${FIRST_USER_NAME}/"


