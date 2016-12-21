#!/bin/bash

#===============================================================================
#
# script to update/install srwlin from buzmakov package
#
# srio@esrf.eu
#
#===============================================================================
#
#

# export all_proxy=http://proxy.esrf.fr:3128/

# clean old stuff
rm -rf SRW

#define python
source oasys1env/bin/activate
export PYTHON_SITE_PACKAGES=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`

echo "Cleaning old installation files..."
rm $PYTHON_SITE_PACKAGES/srwlpy.so
rm $PYTHON_SITE_PACKAGES/uti*.py 
rm $PYTHON_SITE_PACKAGES/srwl_uti*.py 
rm $PYTHON_SITE_PACKAGES/srwlib.py


# srwlib
echo "Installing Oasys dependency srwlib"

#
# download and unpack from Oleg's site
#
git clone https://github.com/ochubar/SRW

#
# alternatively, download and unpack from Buzmakov's site
#
# TODO: This does not work
#curl -O https://github.com/buzmakov/SRW/archive/feature/srw_lite_update.zip
# TODO: Download manually (set the address in web browser)
#cp ~/Downloads/SRW-feature-srw_lite_update.zip SRW.zip
#unzip SRW.zip
#rm SRW.zip
#mv SRW-feature-srw_lite_update SRW
#cd SRW/ext_lib
#cp ~/Downloads/fftw-2.1.5.tar.gz .
# TODO: Download manually from https://github.com/ochubar/SRW/blob/master/ext_lib/#fftw-2.1.5.tar.gz?raw=true

#
# build fftw
#
cd SRW/ext_lib
rm -rf  fftw-2.1.5
tar -zxvf fftw-2.1.5.tar.gz
cd fftw-2.1.5
./configure --enable-float --with-pic
cp Makefile Makefile.orig
# add -fPIC option to CFLAGS in Makefile
#TODO : this did not work for Mac
sed -e "s/^CFLAGS =/CFLAGS = -fPIC/" Makefile -i
make
#make install
cp fftw/.libs/libfftw.a ..
cd ../..
echo "Done fftw"
pwd

#
# build srw
#
cd cpp/gcc
# backup
cp Makefile Makefile.orig
# Modify existing Makefile
mv Makefile Makefile.tmp
# comment existing PYFLAGS and PYPATH
sed -i -e "s/^PYFLAGS/#PYFLAGS/" Makefile.tmp 
sed -i -e "s/^PYPATH/#PYPATH/" Makefile.tmp
# add the correct python path, include and lib directories
echo "PYPATH = `echo $HOME/OASYS_VE/oasys1env`" > Makefile
echo "PYFLAGS = -I\$(PYPATH)/include/`ls $HOME/OASYS_VE/oasys1env/include/` -L\$(PYPATH)/lib/`ls $HOME/OASYS_VE/oasys1env/lib/`" >> Makefile
cat Makefile.tmp >> Makefile
rm Makefile.tmp
# make (creates libsrw.a)
rm libsrw.a
make -j8 clean lib

# make (creates srwlpy.so and puts it in env/work/srw_python/)
cd ../py
make python

cd ../../
echo "Done srw"
pwd

#
# install
#
cp env/work/srw_python/srwlpy.so $PYTHON_SITE_PACKAGES
cp env/work/srw_python/uti*.py $PYTHON_SITE_PACKAGES
cp env/work/srw_python/srwl_uti*.py $PYTHON_SITE_PACKAGES
cp env/work/srw_python/srwlib.py $PYTHON_SITE_PACKAGES
echo "Done installing"
#
#
cd ..
echo "All done. "
pwd
