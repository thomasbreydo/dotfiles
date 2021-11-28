#!/usr/bin/env bash


if [[ HASROOT -eq 1 ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    mkdir $HOME/.homebrew
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C .homebrew
    eval "$(homebrew/bin/brew shellenv)"
    brew update --force --quiet
    chmod -R go-w "$(brew --prefix)/share/zsh"
fi

brew bundle
