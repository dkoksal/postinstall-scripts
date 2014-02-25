#! /bin/sh
sudo rm -rv binary
mkdir -pv binary/live && mkdir -p binary/isolinux
sudo cp -v x86_64/boot/vmlinuz-3.2.0-4-amd64 binary/live/vmlinuz
sudo cp -v x86_64/boot/initrd.img-3.2.0-4-amd64 binary/live/initrd
sudo mksquashfs x86_64 binary/live/filesystem.squashfs -comp xz -e boot
sudo cp -v x86_64/usr/lib/syslinux/isolinux.bin binary/isolinux/.
sudo cp -v x86_64/usr/lib/syslinux/menu.c32 binary/isolinux/.
echo 'ui menu.c32
prompt 0
menu title Boot Menu
timeout 300

label live-amd64
	menu label ^Live (amd64)
	menu default
	linux /live/vmlinuz
	append initrd=/live/initrd boot=live persistence quiet
label live-amd64-failsafe
	menu label ^Live (amd64 failsafe)
	linux /live/vmlinuz
	append initrd=/live/initrd boot=live persistence config memtest noapic noapm nodma nomce nolapic nomodeset nosmp nosplash vga=normal
endtext
' >> binary/isolinux/isolinux.cfg
sudo chmod 777 binary/isolinux/isolinux.bin
xorriso -as mkisofs -r -J -joliet-long -l -cache-inodes \
-isohybrid-mbr x86_64/usr/lib/syslinux/isohdpfx.bin -partition_offset 16 \
-A "Debian Live" -b isolinux/isolinux.bin -c \
isolinux/boot.cat -no-emul-boot -boot-load-size 4 \
-boot-info-table -o wulf64rout.iso binary
chmod 777 wulf64rout.iso

