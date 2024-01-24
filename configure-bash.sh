#!/bin/bash
set -e

##
## This script sets up aliases & functions to use in bash shell
##

RED='\033[1;31m'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

scriptPath=$(pwd)

echo -e "${ORANGE}\nConfiguring ~/.bashrc${NC}"

bashFilesFolder="$HOME/.bash-files"
echo -e "${ORANGE}\nCopy bash files to $bashFilesFolder/...${NC}"

mkdir -p $bashFilesFolder
cp $scriptPath/.bash_aliases $bashFilesFolder/.bash_aliases
cp $scriptPath/.bash_functions $bashFilesFolder/.bash_functions

echo -e "${ORANGE}\nWrite config to $HOME/.bashrc...${NC}"

if ! grep -Fxq " source $bashFilesFolder/.bash_aliases" $HOME/.bashrc; then
  aliasText="\n# Aliases\nif [ -e $bashFilesFolder/.bash_aliases ]; then\n  source $bashFilesFolder/.bash_aliases\nfi\n"
  echo -e $aliasText >> $HOME/.bashrc
fi

if ! grep -Fxq " source $bashFilesFolder/.bash_functions" $HOME/.bashrc; then
  funcText="\n# Function definitions\nif [ -e $bashFilesFolder/.bash_functions ]; then\n  source $bashFilesFolder/.bash_functions\nfi\n"
  echo -e $funcText >> $HOME/.bashrc
fi

if ! grep -Fxq " source $bashFilesFolder/.bash_config" $HOME/.bashrc; then
  rcText="\n# Bash Rc Config\nif [ -e $bashFilesFolder/.bash_config ]; then\n  source $bashFilesFolder/.bash_config\nfi\n"
  echo -e $rcText >> $HOME/.bashrc
fi

echo -e "${GREEN}Fertig! Restarting shell for changes to be applied...${NC}"
source $HOME/.bashrc && echo 'bashrc reloaded...'
