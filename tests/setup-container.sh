#!/bin/bash

git config --global credential.helper

# Update gem system and install required gems
gem update --system
gem install csv morpheus-cli

# Install act
curl -fsSL https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
sudo mv bin/act /usr/local/bin/

# Update packages and install Docker
sudo apt-get update
sudo apt-get install -y docker.io

# Configure Docker permissions
sudo usermod -aG docker "$USER"
newgrp docker
sudo chown vscode:vscode /var/run/docker.sock

# Configure Git
git config --global user.name "$GITHUB_USERNAME"
git config --global user.email "$GITHUB_EMAIL"

# Install pre-commit
pip install pre-commit
pre-commit install
pre-commit run --all-files

exit 0