## Installing on a new machine

In any shell, run

```fish
bash -c 'sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply thomasbreydo'
```

As part of the install script, `chezmoi` will install itself with brew.

## To save changes

In `fish` shell, run

```fish
chezmoi re-add; chezmoi update; chezmoi git push
```

Breaking it down,

- `re-add` checks for changes to the actual files (e.g. `~/.ssh/config`)

- `update` pulls and applies changes from GitHub (may need to resolve merge conflict)

- `git push` pushes changes


TODO
	on this comp...
	maybe manually 'brew install gnupg' if not root bc it doesn't work otherwise (brew bundle decides to skip it)
	brew install nvim if not already installed
	nvim config
	fish config (from scratch ish!)

