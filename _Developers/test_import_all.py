#
# test to import all packages used by Oasys
#
import PyQt5

from PyQt5.QtCore import QT_VERSION_STR
from PyQt5.Qt import PYQT_VERSION_STR
from sip import SIP_VERSION_STR

print("Qt version:", QT_VERSION_STR)
print("SIP version:", SIP_VERSION_STR)
print("PyQt version:", PYQT_VERSION_STR)

import numpy
print("numpy version:", numpy.__version__)
import scipy
print("scipy version:", scipy.__version__)


import matplotlib
print("matplotlib version:", matplotlib.__version__)

import xraylib
import srxraylib
import Shadow
import syned
import wofry
import silx
print("Silx version: ",silx.version)


import orangecanvas
import oasys

