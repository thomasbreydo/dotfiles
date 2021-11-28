#!/usr/bin/env bash

set -ueo pipefail

{{ if .has_root }}
export HASROOT=0
{{ else }}
export HASROOT=1
{{ end }}

scripts/install-homebrew.sh

brew bundle

scripts/setup-fish.sh
