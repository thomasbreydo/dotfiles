#!/usr/bin/env fish
# vim: set filetype=bash: Vim doesn't handle .fish well


# ignoring failure because fish_add_path fails if path exists

fish_add_path -v "~/bin/"; or true
fish_add_path -v (ruby -e 'print Gem.user_dir')/bin/; or true

