#!/bin/bash

# bosh deploymnet download 
git clone https://github.com/cloudfoundry/bosh-deployment ~/workspace/bosh-deployment

# cf deployment download
git clone https://github.com/cloudfoundry/bosh-deployment ~/workspace/cf-deployment

# Env file store in the vbox
mkdir -p ~/deployments/vbox

# Setting the bosh-lite-env.sh & deploy_cf.sh 
@ ~/deployments/bosh-lite-env.sh
@ ~/deployments/deploy_cf.sh

git clone https://github.com/BoShare/CCCR-Edu

cd CCCR-Edu

cp *.sh ~/workspace/deployments/.

# cd ~/workspace/deployments/vbox
# Running bosh-lite-env.sh
# ./../bosh-lite-env.sh
# Runing deploy_cf.sh
# ./../deploy_cf.sh


