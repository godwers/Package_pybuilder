#!/usr/bin/bash

echo "What's the name of your project?"
read -r PROJECT_NAME
source build.sh "$PROJECT_NAME"
echo "Completed! :)"
