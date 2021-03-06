#!/bin/bash


function packer-install() {
  OS=$(uname -s)
  [[ -f ${HOME}/bin/packer ]] && echo "`${HOME}/bin/packer version` already installed at ${HOME}/bin/packer" && return 0
  LATEST_URL=$(curl -sL https://releases.hashicorp.com/packer/index.json | jq -r '.versions[].builds[].url' | sort -n | egrep -v 'rc|beta' | egrep "${OS,,}.*amd64" |tail -1)
  curl ${LATEST_URL} > /tmp/packer.zip
  mkdir -p ${HOME}/bin
  (cd ${HOME}/bin && unzip /tmp/packer.zip)
  if [[ -z $(grep 'export PATH=${HOME}/bin:${PATH}' ~/.zshrc 2>/dev/null) ]]; then
  	echo 'export PATH=${HOME}/bin:${PATH}' >> ~/.zshrc
  fi
  
  echo "Installed: `${HOME}/bin/packer version`"
  
  cat - << EOF 
 
Run the following to reload your PATH with packer:
  source ~/.zshrc
EOF
}

packer-install