#!/usr/bin/bash

echo "What's the name of your project?"
read -r PROJECT_NAME
source build.sh "$PROJECT_NAME"
echo "Do you want to create a Git repo? (Y/N)"
read -r OPTION_CREATE
if [ "$OPTION_CREATE" == "Y" ] || [ "$OPTION_CREATE" == "y" ]; then
  source gitbuilder.sh "$PROJECT_NAME/"
fi
