#!/usr/bin/env bash

echo Installing fish with brew
brew install fish

echo Setting the login shell to fish
chsh -s `which fish`
