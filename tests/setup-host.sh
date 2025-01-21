#!/bin/bash

# TODO - Adicionar verificação de sistema operacional, para instalar dependências corretas. Verificar se já existem

set -e

# Instalar features adicionais
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo "export PATH=${HOME}/.rbenv/bin:$PATH" >> ~/.bashrc
echo "eval $(rbenv init -)" >> ~/.bashrc
# shellcheck disable=SC1090
# shellcheck disable=SC2088
source "~/.bashrc"
rbenv install 3.3.1
rbenv global 3.3.1

# Atualizar gem e instalar gems necessárias
gem update --system
gem install csv morpheus-cli

# Instalar Python via pyenv
curl https://pyenv.run | bash

# shellcheck disable=SC2129
echo "export PATH=$HOME/.pyenv/bin:$PATH" >> ~/.bashrc
echo "eval $(pyenv init --path)" >> ~/.bashrc
echo "eval $(pyenv init -)" >> ~/.bashrc
echo "eval $(pyenv virtualenv-init -)" >> ~/.bashrc

# shellcheck disable=SC2088
# shellcheck disable=SC1090
source "~/.bashrc"
pyenv install 3.11.2
pyenv global 3.11.2

# Instalar Terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install -y terraform


# Instalar GitHub CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
sudo apt-add-repository "deb [arch=amd64] https://cli.github.com/packages stable main"
sudo apt-get update
sudo apt-get install -y gh

# Instalar act
curl -fsSL https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
sudo mv bin/act /usr/local/bin/

echo "Ambiente de desenvolvimento configurado com sucesso!"
