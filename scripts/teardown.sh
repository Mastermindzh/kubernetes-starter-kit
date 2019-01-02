#!/bin/bash
# this file undoes what "generate.sh" did.

# load in the required scripts
source scripts/helpers/init-settings.sh # initial settings
source scripts/helpers/helpers.sh # helper functions
source scripts/config.sh # user configured settings

# ask whether the user is sure
switchColor "red"
echo "Warning: this will undo all changes that generate.sh made"
read -p "Press ENTER to continue or Ctrl+C to exit"
switchColor 

# kubectl delete ...