#autoinsaller + checker script

#!/bin/bash


wizardroot='/tmp/driverwizard'
rm -rf $wizardroot

mkdir -p $wizardroot

tar -xf $1 -C $wizardroot

 
cd $wizardroot && cd * ;

`./amdgpu-pro-install -y` 



read -p 'Driver installation completed, would you like to reboot now?(n/y) ' ans
rm -rf $wizardroot

if [ ans -e 'y'] then
	echo -e 'done'
fi