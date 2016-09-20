#!/bin/bash
#source `dirname $0`/oasys1env/bin/activate
source `find /home -name "start_oasys.sh" -printf "%h"`/oasys1env/bin/activate
python -m oasys.canvas -l4 --force-discovery

