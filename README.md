# Step 1: Automated configuration

## Installing on a new machine

```sh
git clone git@github.com:thomasbreydo/dotfiles.git ~/dotfiles
brew install stow && cd ~/dotfiles && stow .
```

## More about stow

Some dotfiles aren't tracked (for example because they contain secrets), including

```
~/.aws/credentials
~/.netrc
```

and others.

The [`old/`](old) directory contains old dotfiles, in case I ever want to look at them.
They're ignored by stow (see `.stow-local-ignore`).

Say I wanted to start tracking my `~/.config/tmux/tmux.conf` file. I could do

```sh
cd ~/dotfiles
mkdir -p .config/tmux/
cp ../.config/tmux/tmxu.conf .config/tmux/tmux.conf
```

# Step 2: Manual tweaks

## Skim

In Skim preferences, under `Sync`,

- turn on `Check for file changes`

- turn on`Reload automatically`.

- set `PDF-TeX Sync support` to

```
Preset:      Custom
Command:     nvim
Arguments:   --headless -c "VimtexInverseSearch %line '%file'"
```

## TeXLab

To ensure that TeXLab sees custom style files in
`kpsewhich -var-value TEXMFHOME` (e.g. `thomas.sty`), run

```
mktexlsr (kpsewhich -var-value TEXMFHOME)
```
