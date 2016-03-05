#!/bin/bash

source ~/.rvm/scripts/rvm

timestamp=`date +%F_%H-%M-%S`

EXECUTABLE='thin start -p 3001 --ssl --ssl-key-file ~/.ssl/tam4dummies.key --ssl-cert-file ~/.ssl/tam4dummies.crt'

eval $EXECUTABLE
