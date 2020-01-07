#!/bin/bash

#===============================================================================
#
# script to update/install srwlib
#
# srio@esrf.eu
#
# IMPORTANT: Run it from the virtual environment directory
#
#  ./Developer/install_srw_from_github.sh
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
rm $PYTHON_SITE_PACKAGES/srwlpy*.so
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
# build fftw
#
cd SRW/ext_lib
rm -rf  fftw-2.1.5
tar -zxvf fftw-2.1.5.tar.gz
cd fftw-2.1.5
if [ `uname` == "Linux" ]; then
    export CC=$HOME/miniconda3/bin/cc
fi
./configure --enable-float --with-pic
cp Makefile Makefile.orig
# add -fPIC option to CFLAGS in Makefile
#TODO : this did not work for Mac
sed -e "s/^CFLAGS =/CFLAGS = -fPIC/" Makefile -i
make
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
# remove existing PYFLAGS and PYPATH
if [ `uname` == "Linux" ]; then
    sed -i -e "/^CC/d" Makefile.tmp
    sed -i -e "/^CXX/d" Makefile.tmp
fi
sed -i -e "/^PYFLAGS/d" Makefile.tmp 
sed -i -e "/^PYPATH/d" Makefile.tmp
# add the correct python path, include and lib directories
if [ `uname` == "Linux" ]; then
    echo "CC = `echo $HOME/miniconda3/bin/cc`" > Makefile
    echo "CXX = `echo $HOME/miniconda3/bin/c++`" >> Makefile
fi
echo "PYPATH = `echo $HOME/OASYS_VE/oasys1env`" >> Makefile
echo "PYFLAGS = -I\$(PYPATH)/include/`ls $HOME/OASYS_VE/oasys1env/include/` -L\$(PYPATH)/lib/`echo $HOME/OASYS_VE/oasys1env/lib/`" >> Makefile
cat Makefile.tmp >> Makefile
rm Makefile.tmp
# make (creates libsrw.a)
rm libsrw.a
make -j8 clean lib

# make (creates srwlpy.so and puts it in env/work/srw_python/)
cd ../py
cp Makefile Makefile.orig
#TODO check in mac, but this change seems not to be needed
sed -i -e "s/gcc\/srwlpy/gcc\/srwlpy\*/" Makefile
make python

cd ../../
echo "Done srw"
pwd

#
# install
#
cp env/work/srw_python/srwlpy*.so $PYTHON_SITE_PACKAGES
cp env/work/srw_python/uti*.py $PYTHON_SITE_PACKAGES
cp env/work/srw_python/srwl_uti*.py $PYTHON_SITE_PACKAGES
cp env/work/srw_python/srwlib.py $PYTHON_SITE_PACKAGES
echo "Done installing"
#
#
cd ..
echo "All done for SRW. "
pwd
