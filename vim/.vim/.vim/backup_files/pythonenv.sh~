#!/bin/bash

if [ -z "$1" ]; then 
    echo "var is unset"; 
else 
    mkdir ~/.virtualenvs 2> /dev/null;
    echo "~/.virtualenvs/${1}/bin/activate";
    if [ ! -d "~/.virtualenvs/${1}/bin/activate" ]; then
        virtualenv ~/.virtualenvs/${1} > /dev/null 2>&1 || { echo >&2 "I require Python Virtualenv but it's not installed.  Aborting."; exit 1; }
    fi
fi
source ~/.virtualenvs/${1}/bin/activate;
