## Installing on a new machine

```bash
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --one-shot thomasbreydo
```

As part of the install script, `chezmoi` will install itself with brew.

## Useful commands

To overwrite external changes to my home dir:
	chezmoi re-add

when ready to push:
	chezmoi re-add; chezmoi apply; chezmoi git push
TODO
	on this comp...
	maybe manually 'brew install gnupg' if not root bc it doesn't work otherwise (brew bundle decides to skip it)
	make sure that ~/gpg agent is set to pinentry-mac if not sudo
	brew install nvim if not already installed
	nvim config
	fish config (from scratch ish!)

