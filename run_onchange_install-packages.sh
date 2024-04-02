#!/bin/bash
packages="build-essential curl neofetch tmux traceroute wget whois zsh at git"

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
      echo $app
      sudo nala install $app -y
    done
  else
    sudo apt update && sudo apt upgrade -y
    for app in $packages
    do
      sudo apt install $app -y
    done
  fi
fi
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install gcc
