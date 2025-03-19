#!/bin/sh

PORT_HOME="$(dirname "$0")/.data/SORR"

cd "$PORT_HOME"

mount rootfs mnt
mount -o bind /sys mnt/sys
mount -o bind /dev mnt/dev
mount -o bind /proc mnt/proc
chroot mnt /bin/sh -c "su - -c /sorr/launch.sh"
umount mnt/proc
umount mnt/sys
umount mnt/dev
umount mnt