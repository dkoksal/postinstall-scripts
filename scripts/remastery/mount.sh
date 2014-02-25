#! /bin/sh
# for f in proc sys dev ; do mount --bind /$f /mnt/$f ; done
mount none -t proc /proc
mount none -t sysfs /sys
mount none -t devpts /dev/pts
cd home
./cfgmnt

