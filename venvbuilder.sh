#!/usr/bin/bash
# Only use this script inside a python project folder

VE="venv/"
if [ ! -d $VE ]; then
  mkdir $VE
else
  echo "This folder already exist!"
fi

python -m venv $VE

if [ -d venv/bin ] && [ -e venv/bin/activate ]; then
  . venv/bin/activate || exit
else
  echo "Something went wrong"
fi
