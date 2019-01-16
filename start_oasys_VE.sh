#!/bin/bash
source ~/oasys1env/bin/activate
#source `find /home -name "start_oasys.sh" -printf "%h"`/oasys1env/bin/activate
export LD_LIBRARY_PATH=~/oasys1env/lib/xraylib
export DYLD_LIBRARY_PATH=~/oasys1env/lib/xraylib
python -m oasys.canvas -l4 --force-discovery

