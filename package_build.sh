#!/usr/bin/bash
# read from the bottom to the top to understand the code

function create_virtual_enviroment() {
  printf "Creating virtual enviroment...\n"
  mkdir "venv"
  python -m venv venv/
  printf "Activating virtual enviroment...\n"
  source venv/bin/activate
}

function create_source_files() {
  mkdir "$PROJECT_NAME"
  cd "$PROJECT_NAME" || return 0
  touch "__init__.py"
  touch "main.py"
  cd ..
}

function create_files() {
  printf "Creating files...\n"
  touch ".gitignore"
  echo "dist/" >>".gitignore"
  echo "build/" >>".gitignore"
  echo "__pycache__/" >>".gitignore"
  echo "venv/" >>".gitignore"
  echo "*.pyc" >>".gitignore"
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

function package_configuration() {
  printf "Configuring the package...\n"
  python -m pip install .
  python -m pip install --editable .
  pip install build
  python -m build
}

function main() {
  clear
  echo "What's the name of your project?"
  read -r PROJECT_NAME
  clear
  package_builder "$PROJECT_NAME"
  package_configuration
  echo "Completed! :)"
  sleep 3
  clear
}

main
