#!/bin/bash -e
cp files/kiosk.sh "${ROOTFS_DIR}/home/pi/kiosk.sh" 
cp files/kiosk.service "${ROOTFS_DIR}/lib/systemd/system/kiosk.service" 

on_chroot << EOF
	sudo systemctl enable kiosk.service
EOF
