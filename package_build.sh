#!/usr/bin/bash

function create_virtual_enviroment() {
  mkdir "venv"
  python -m venv venv/
}

function create_source_files() {
  mkdir "$PROJECT_NAME"
  cd "$PROJECT_NAME" || return 0
  touch "__init__.py"
  touch "main.py"
  cd ..
}

function create_files() {
  touch ".gitignore"
  touch "setup.py"
  touch "README.md"
  touch "LICENSE"
  touch "pyproject.toml"
  mkdir "tests"
  create_source_files "$PROJECT_NAME"
}

function package_builder() {
  if [ ! -d "$PROJECT_NAME/" ]; then
    mkdir "$PROJECT_NAME"
  else
    echo "There's already a project with this name."
    exit 1
  fi
  cd "$PROJECT_NAME" || exit 1
  create_files "$PROJECT_NAME"
  create_virtual_enviroment
}

echo "What's the name of your project?"
read -r PROJECT_NAME
package_builder "$PROJECT_NAME"
echo "Completed! :)"
