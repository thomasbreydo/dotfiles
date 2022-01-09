#!/usr/bin/env fish
# vim: set filetype=bash: Vim doesn't handle .fish well

abbr -a -U -- l 'ls -lAFh'
abbr -a -U -- cm 'chezmoi'
abbr -a -U -- lmk 'latexmk'
abbr -a -U -- clac 'ssh -X tb2960@clac.cs.columbia.edu'
abbr -a -U -- vi 'nvim'
abbr -a -U -- t 'tmux'
abbr -a -U -- ta 'tmux attach'
abbr -a -U -- lop 'cd ~/linalg; and ./open.sh'
abbr -a -U -- abbrs 'nvim (chezmoi execute-template "{{.extras_dir}}")/setup_abbrs.fish'
