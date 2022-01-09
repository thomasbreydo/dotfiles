#!/usr/bin/env fish
# vim: set filetype=bash: Vim doesn't handle .sh.tmpl well

abbr -a -U -- l 'ls -lAFh'
abbr -a -U -- cm 'chezmoi'
abbr -a -U -- lmk 'latexmk'
abbr -a -U -- clac 'ssh -X tb2960@clac.cs.columbia.edu'
abbr -a -U -- vi 'nvim'
abbr -a -U -- t 'tmux'
abbr -a -U -- ta 'tmux attach'
abbr -a -U -- np 'cd ~/linalg; and ./newprob.sh'
abbr -a -U -- abbrs 'nvim {{ .chezmoi.sourceDir -}}{{- .chezmoi.sourceFile }}'
