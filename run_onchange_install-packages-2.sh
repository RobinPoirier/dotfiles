#!/bin/bash

source ~/.bashrc

#  Brew packages to install
brew_app="gcc starship"

if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]
then
  for bapp in $brew_app
  do
    /home/linuxbrew/.linuxbrew/bin/brew install $bapp
  done
fi
