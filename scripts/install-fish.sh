#!/usr/bin/env zsh

brew install fish
which fish >> /etc/shells
chsh -s `which fish`

