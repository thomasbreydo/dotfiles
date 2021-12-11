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

## Maintenance

Plugins are tracked automatically. Run

```
fisher install <plugin>
```

to both install and track.
