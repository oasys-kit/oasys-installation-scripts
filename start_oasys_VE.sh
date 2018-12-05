#!/bin/bash
source ~/oasys1env/bin/activate
#source `find /home -name "start_oasys.sh" -printf "%h"`/oasys1env/bin/activate
python -m oasys.canvas -l4 --force-discovery

