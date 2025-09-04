#!/usr/bin/bash

function create_files() {
  touch "README.md"
  touch "LICENSE"
  touch "pyproject.toml"
  mkdir "tests"
  mkdir "$1"
  cd "$1" || return 0
  touch "__init__.py"
  cd ..
}

function package_builder() {
  if [ ! -d "$1/" ]; then
    mkdir "$1"
  else
    echo "There's already an project with this name."
    exit 1
  fi
  cd "$1" || exit 1
  create_files "$1"
  cd .. # return back to the project file
}

package_builder "$1"
