#!/bin/bash

set -eu -o pipefail

STEP() { echo ; echo ; echo "==\\" ; echo "===>" "$@" ; echo "==/" ; echo ; }

cf_deployment="$(cd "$(dirname "${BASH_SOURCE[0]}")"; cd ../cf-deployment; pwd)"
cf_deployment_sha="$(cd "${cf_deployment}"; git rev-parse --short HEAD)"
bosh_deployment="$(cd "$(dirname "${BASH_SOURCE[0]}")"; cd ../bosh-deployment; pwd)"
vbox_deployment="$(cd "$(dirname "${BASH_SOURCE[0]}")"; cd ../deployments/vbox; pwd)"


####
STEP "Upload a runtime-config"
####

#bosh -e vbox update-runtime-config "${bosh_deployment}/runtime-configs/dns.yml" --name dns

####
STEP "Upload a stemcell"
####

# export IAAS_INFO=warden-boshlite

# export STEMCELL_VERSION=$(bosh interpolate "${cf_deployment}/cf-deployment.yml" --path=/stemcells/alias=default/version)

# bosh -e vbox upload-stemcell https://bosh.io/d/stemcells/bosh-${IAAS_INFO}-ubuntu-xenial-go_agent?v=${STEMCELL_VERSION}


####
STEP "Update Config"
####

bosh -e vbox update-cloud-config "${cf_deployment}/iaas-support/bosh-lite/cloud-config.yml"

####
STEP "Deploy CF"
####

bosh -e vbox -d cf deploy \
  "${cf_deployment}/cf-deployment.yml" \
  -o "${cf_deployment}/operations/bosh-lite.yml" \
  -o "${cf_deployment}/operations/use-compiled-releases.yml" \
  --vars-store deployment-vars.yml \
  -v system_domain=bosh-lite.com

####
STEP "cf login"
####

cf login -a api.bosh-lite.com --skip-ssl-validation -u admin -p $(bosh interpolate "${vbox_deployment}/deployment-vars.yml" --path /cf_admin_password)

