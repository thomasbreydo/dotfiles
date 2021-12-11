#!/usr/bin/env bash

chezlog "Login shell is currently $SHELL"
chezlog "Attempting to set the login shell to $(which fish)"
while ! chsh -s `which fish`; do
    if ! prompt_yn "Failed, try again"; then
        break;
    fi
    chezlog "Trying again"
done

