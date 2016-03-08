#!/bin/bash

source ~/.rvm/scripts/rvm

timestamp=`date +%F_%H-%M-%S`

EXECUTABLE='bin/rails s -p 3000 -b 0.0.0.0'

eval $EXECUTABLE