#!/bin/bash

# download stratos file
git clone https://github.com/cloudfoundry-incubator/stratos ~/workspace/stratos
cd ~/workspace/stratos

# pre build for task resource
npm install
npm run prebuild-ui

# app push
# After cf login

cf push

# finished
