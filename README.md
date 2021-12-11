## Installing on a new machine


### Step 1: Automated configuration

In any shell, run

```fish
bash -c 'sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply thomasbreydo'
```

As part of the install script, `chezmoi` will install itself with brew.


### Step 2: Manual tweaks

#### Skim

In Skim preferences, under `Sync`,

- turn on `Check for file changes`

- turn on`Reload automatically`.

- set `PDF-TeX Sync support` to

```
Preset:      Custom
Command:     nvim
Arguments:   --headless -c "VimtexInverseSearch %line '%file'"
```

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
