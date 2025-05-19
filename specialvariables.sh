#!/bin/bash

echo "all variables passed to script : " $@
echo "number of variables : " $#
echo "script name : " $0
echo "present working directory : " $PWD
echo "user running this script : " $HOME
echo " user running this script : " $USER  
echo "pid of current script: " $$
sleep 10 &
echo "pid of command running background : " $! 