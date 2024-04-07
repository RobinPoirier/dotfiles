#!/bin/bash

# Packages to install
packages="software-properties-common apt-transport-https build-essential curl neofetch tmux traceroute wget gpg whois zsh at git" # smbclient"

if command -v apt
then
  if ! command -v nala
  then
    sudo apt update && sudo apt install nala -y
  fi
  if command -v nala
  then
    sudo nala update && sudo nala upgrade -y
    for app in $packages
    do  
      sudo nala install $app -y
    done
  else
    sudo apt update && sudo apt upgrade -y
    for app in $packages
    do
      sudo apt install $app -y
    done
  fi
elif command -v dnf
then
  sudo dnf update -y
  for app in $packages
  do
    sudo dnf install $app -y
  done
fi

# # Microsoft GPG Key
# wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
# sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

# # Microsoft VS Code repo
# sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

# # Update repo and install code
# if command -v nala
# then
#   sudo nala update && sudo nala install code -y
# elif command -v apt
#   sudo apt update && sudo apt install code -y
# fi

# if command -v dnf
#   sudo dnf update -y && sudo dnf install code -y
# fi

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source ~/.bashrc
# brew install gcc
