#!/usr/bin/bash

cd "$HOME" || exit 1
git clone https://github.com/godwers/Package_pybuilder
python Package_pybuilder/src/alias.py
