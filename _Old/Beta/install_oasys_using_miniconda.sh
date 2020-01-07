#!/bin/bash

# Installs ShadowOui into Linux home directory as "ShadowOui"
# support is only for Linux at this time

# assume these things are already installed:
# bash
# wget
# curl
# git
# compilers: C, C++, FORTRAN
# OpenGL and development package (header files)
# libGLU and development package (header files)

cd ..

echo "#----------> Downloading Miniconda installer"
#export SHADOWOUI_HOME=$HOME/ShadowOui
export SHADOWOUI_HOME=$HOME/Oasys_Application
mkdir -p $SHADOWOUI_HOME
cd $SHADOWOUI_HOME
wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh

echo "#----------> Installing Miniconda and Python3 into $SHADOWOUI_HOME"
bash miniconda.sh -b -p $SHADOWOUI_HOME/x86_64
export PATH=$SHADOWOUI_HOME/x86_64/bin:$PATH

echo `which python`
echo `which pip`
echo `which conda`

export PYTHON_SITE_PACKAGES=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`

echo "#----------> Updating Python3 packages"
conda update --yes conda pip

echo "#----------> Installing additional pre-built packages"
conda install --yes \
	pyqt=4 \
	numpy \
	scipy \
	matplotlib=1.4.3 \
	python-dateutil \
	pytz \
	pyparsing \
	nose \
	swig


# xraylib
echo "#----------> Installing Oasys dependency xraylib"
curl -O http://lvserver.ugent.be/xraylib/xraylib-3.2.0.tar.gz
tar xvfz xraylib-3.2.0.tar.gz
cd xraylib-3.2.0
./configure --enable-python --enable-python-integration PYTHON=`which python`
make
cp python/.libs/_xraylib.so  $PYTHON_SITE_PACKAGES
cp python/xrayhelp.py $PYTHON_SITE_PACKAGES
cp python/xraylib.py $PYTHON_SITE_PACKAGES
cp python/xraymessages.py  $PYTHON_SITE_PACKAGES
cd ..


# srxraylib
echo "#----------> Installing Oasys dependency srxraylib"
git clone https://github.com/lucarebuffi/srxraylib
cd srxraylib
pip install -e . --no-binary :all:
cd ..


#shadow3
echo "#----------> Installing Oasys dependency shadow3"
git clone https://github.com/srio/shadow3
cd shadow3
python setup.py build
pip install -e . --no-binary :all:
cd ..


# fisx
echo "#----------> Installing pymca dependency fisx"
git clone https://github.com/vasole/fisx
cd fisx
python setup.py install
cd ..


#pymca
echo "#----------> Installing Oasys dependency pymca"
pip install PyMca5
# git clone https://github.com/vasole/pymca
# cd pymca
# python setup.py install
# cd ..


echo "#----------> Installing Oasys..."
pip install oasys


# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
echo "#----------> Configuring script to run OASYS & ShadowOui..."
export SCRIPT=$SHADOWOUI_HOME/start_oasys_shadowoui.sh

cmd="#\x21/bin/bash"
cmd+="\n\n"
cmd+="$SHADOWOUI_HOME/x86_64/bin/python -m oasys.canvas &"
echo -e $cmd > $SCRIPT
chmod +x $SCRIPT

echo ""
echo ""
echo "#---------------------------"
echo ""
echo "Instructions"
echo "============"
echo ""
echo "* start ShadowOui with this command: $SCRIPT"
echo "* click on Add-Ons"
echo "* check next to ShadowOui (options: OASYS-XRayServer & OASYS-XOPPY)"
echo "* click OK button"
echo "* wait for installation"
echo "* restart oasys"
