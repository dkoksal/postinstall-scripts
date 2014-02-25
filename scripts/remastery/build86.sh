#! /bin/sh
rm -rv binary
mkdir -pv binary/live && mkdir -p binary/isolinux
sudo cp -v i386/boot/vmlinuz-3.2.0-4-i386 binary/live/vmlinuz
sudo cp -v i386/boot/initrd.img-3.2.0-4-i386 binary/live/initrd
sudo mksquashfs i386 binary/live/filesystem.squashfs -comp xz -e boot
sudo cp -v i386/usr/lib/syslinux/isolinux.bin binary/isolinux/.
sudo cp -v i386/usr/lib/syslinux/menu.c32 binary/isolinux/.
echo 'ui menu.c32
prompt 0
menu title Boot Menu
timeout 300

label live-i386
	menu label ^Live (i386)
	menu default
	linux /live/vmlinuz
	append initrd=/live/initrd boot=live persistence quiet
label live-i386-failsafe
	menu label ^Live (i386 failsafe)
	linux /live/vmlinuz
	append initrd=/live/initrd boot=live persistence config memtest noapic noapm nodma nomce nolapic nomodeset nosmp nosplash vga=normal
endtext
' >> binary/isolinux/isolinux.cfg
xorriso -as mkisofs -r -J -joliet-long -l -cache-inodes \
-isohybrid-mbr i386/usr/lib/syslinux/isohdpfx.bin -partition_offset 16 \
-A "Debian Live" -b /home/dyngar-m/.OS/binary/isolinux/isolinux.bin -c \
isolinux/boot.cat -no-emul-boot -boot-load-size 4 \
-boot-info-table -o wulf86.iso binary
chmod 777 wulf86.iso

