#!/bin/bash

# load in the required scripts
source scripts/helpers/init-settings.sh # initial settings
source scripts/helpers/helpers.sh # helper functions
source scripts/config.sh # user configured settings

# User validation
printVariable "Service name" $SERVICENAME
validateExecutionConditions

# Script
systemMessage "Starting the provisioning of $SERVICENAME"