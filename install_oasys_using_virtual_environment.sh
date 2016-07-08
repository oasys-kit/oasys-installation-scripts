#!/bin/bash

#===============================================================================
#
# script to install OASYS in a LINUX virtual environment (sudo is not required)
#
# Before starting make sure that your system has installed: 
#      - python3
#      - virtualenv
#      - qt and pyqt
#   If any of these items is not present in your system, contact the
#   system administrator and ask for their installation.     
#   
# Then place this script in a suitable directory (e.g., $HOME/OrangeVE) and run 
# this script automatically (it may take a very ling time) or manually by 
# copy/paste line by line, if you want to detect possible errors). 
#
# Then start oasys by:
#   source ./oasys1env/bin/activate
#   python -m oasys.canvas -l4 --force-discovery
#
#===============================================================================
#
#


#
# step 0: some local needs, like for ESRF proxy and clean all stuff
#

# proxy 
# export https_proxy=http://proxy.esrf.fr:3128/
# export http_proxy=http://proxy.esrf.fr:3128/

# clean old stuff
echo "Cleaning old installation files..."
rm -rf =* oasys1 shadow3 xraylib* srxraylib shadowOui pymca
# clean old virtual environment
rm -rf oasys1env 


#
# step 1: create and start python3 virtual environment
#

virtualenv -p python3 --system-site-packages oasys1env
source oasys1env/bin/activate

#
# step 2: install Orange dependencies with pip (it can take a very very
# long time, in particular scipy) 
#

echo "Installing Orange dependency numpy"
pip install --upgrade numpy>=1.9.0
echo "Installing Orange dependency scipy"
pip install --upgrade scipy>=0.11.0

# echo "Installing Orange dependency bottlechest"
# # NOTE: better to install from sources to avoid problems (with numpy version?) 
# # pip install --upgrade bottlechest>=0.7.0
# git clone https://github.com/biolab/bottlechest
# cd bottlechest
# python setup.py install
# cd ..

# echo "Installing Orange dependency chardet"
# pip install --upgrade chardet>=2.3.0
# echo "Installing Orange dependency nose"
# pip install --upgrade nose==1.2.1
# echo "Installing Orange dependency JinJa2"
# pip install --upgrade Jinja2==2.6
# echo "Installing Orange dependency Sphinx"
# pip install --upgrade Sphinx>=1.3
# echo "Installing Orange dependency recommonmark"
# pip install --upgrade recommonmark>=0.1.1
# echo "Installing Orange dependency numpydoc"
# pip install --upgrade numpydoc
# echo "Installing Orange dependency beautifulsoup4"
# pip install --upgrade beautifulsoup4
# echo "Installing Orange dependency xldr"
# pip install --upgrade xlrd>=0.9.2

#
# step 3 install Oasys+ShadowOui dependencies
#

echo "Installing Oasys dependency orange-canvas-core"
pip install --upgrade orange-canvas-core>=0.0.7

echo "Installing Oasys dependency orange-widget-core"
pip install --upgrade orange-widget-core>=0.0

#matplotlib 
echo "Installing matplotlib"
pip install --upgrade matplotlib==1.4.3

# xraylib
echo "Installing Oasys dependency xraylib"
curl -O http://lvserver.ugent.be/xraylib/xraylib-3.2.0.tar.gz
tar xvfz xraylib-3.2.0.tar.gz
cd xraylib-3.2.0
./configure --enable-python --enable-python-integration PYTHON=`which python`
make
export PYTHON_SITE_PACKAGES=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
cp python/xrayhelp.py $PYTHON_SITE_PACKAGES 
cp python/xraylib.py $PYTHON_SITE_PACKAGES 
cp python/.libs/xraylib_np.so  $PYTHON_SITE_PACKAGES
cp python/.libs/_xraylib.so  $PYTHON_SITE_PACKAGES
cp python/xraymessages.py  $PYTHON_SITE_PACKAGES 
cd ..

#SRxraylib
echo "Installing Oasys dependency SRxraylib"
git clone https://github.com/lucarebuffi/srxraylib
cd srxraylib
python setup.py install
cd ..

#shadow3
echo "Installing Oasys dependency shadow3"
git clone https://github.com/srio/shadow3
cd shadow3
python setup.py build
python setup.py develop
cd ..

#pymca
echo "Installing Oasys dependency pymca"
git clone https://github.com/vasole/pymca
cd pymca
python setup.py install
cd ..

#
# step 4 install oasys and shadowOui
#
echo "Installing Oasys..."
git clone https://github.com/lucarebuffi/oasys1
cd oasys1
python setup.py develop
cd ..

echo "Installing ShadowOui"
git clone https://github.com/lucarebuffi/shadowOui
cd shadowOui
python setup.py develop
cd ..

echo "All done. You can start Oasys+ShadowOui using ./start_oasys.sh"
