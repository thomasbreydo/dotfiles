#!/usr/bin/env bash

brew install fish
which fish >> /etc/shells
chsh -s `which fish`

