#!/bin/bash
#copy cfg file

Kdir=$1
Baseconf=$2
Threads=`grep -c ^processor /proc/cpuinfo`

cd $Kdir

make distclean -j$Threads #clean the root

cp -v /boot/config-$(uname -r) .config 

make olddefconfig -j$Threads

./scripts/kconfig/merge_config.sh .config ../$Baseconf
#build


fakeroot make-kpkg --initrd --revision=1.0.NAS kernel_image kernel_headers -j$Threads

