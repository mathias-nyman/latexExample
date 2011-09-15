#!/bin/bash

#--------------------------------------------#
# This script will install pygments from main 
# dev source under the ~/.local directory.
#--------------------------------------------#

mkdir -p /tmp/$USER-pygments-install
cd /tmp/$USER-pygments-install
hg clone http://dev.pocoo.org/hg/pygments-main pygments
cd pygments
python setup.py build
python setup.py install --user

# Done.
exit 0
