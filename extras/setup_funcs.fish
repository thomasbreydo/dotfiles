#!/usr/bin/env fish
# vim: set filetype=bash: Vim doesn't handle .fish well

function mdcd -a dir; mkdir "$dir"; and cd "$dir"; end
funcsave mdcd

