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

#### YouCompleteMe

1. Open `nvim` to have `:PlugInstall` run automatically.

1. Then, set up YCM:

```fish
PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.9.9
cd ~/.local/share/nvim/site/plugged/YouCompleteMe
PYENV_VERSION=3.9.9 python3 install.py
```

YCM requires dynamic build of Python (hence the fresh Python install with
`--enable-framework`).

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
