#!/usr/bin/env zsh

echo Installing fish with brew
brew install fish

echo Setting the login shell to fish
which fish >> /etc/shells
chsh -s `which fish`

