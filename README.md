# Cloudfoundry Bosh-lite 용 스크립트

## 설치 순서
  1. Bosh v2 cli 를 설치 : https://bosh.io/docs/cli-v2-install/
  2. Virtualbox 설치 : https://www.virtualbox.org/wiki/Downloads
  3. bosh-deployment download 후 설치 : https://github.com/cloudfoundry/bosh-deployment
  4. Stemcell download : https://bosh.cloudfoundry.org/stemcells
  5. cf-deployment download 후 설치 : https://github.com/cloudfoundry/cf-deployment
  6. cf cli 설치 : https://docs.cloudfoundry.org/cf-cli/install-go-cli.html, https://github.com/cloudfoundry/cli/blob/master/README.md#downloads
  6. 원하는 서비스 설치 : https://www.cloudfoundry.org
  
## Download 스크립트
* github에서 다운 받는 스크립트

## bosh-lite-env 스크립트
* bosh-lite를 virtualbox에 설치 하는 스크립트

## 해당하는 Stemcell download 필요
* cf-deployment.yml 파일 제일 아랫쪽 stemcell version 확인 필요

## deploy_cf 스크립트
* cloudfoundry 설치 스크립트

## Open Source 화면
* stratos 화면설치 다운: https://github.com/cloudfoundry-incubator/stratos
* 가이드: https://github.com/cloudfoundry-incubator/stratos/tree/v2-master/deploy/cloud-foundry

