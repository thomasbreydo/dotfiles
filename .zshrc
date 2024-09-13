#########################################################################################################
# Path
#########################################################################################################
 
# general
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH

# miscellaneous
export PATH=$HOME/.rbenv/shims:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=/usr/local/mysql/bin/:$PATH

# pyenv
export PATH=$HOME/.pyenv/shims:$PATH
export PATH=$HOME/.pyenv/libexec/pyenv:$PATH
export PATH=$HOME/.pyenv/libexec:$PATH
export PATH=$HOME/.pyenv/bin:$PATH

# homebrew
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=/opt/homebrew/opt/openjdk/bin:$PATH
 
#########################################################################################################
# Tmux
#########################################################################################################

function tgo() {
  if tmux ls &>/dev/null; then
    exec tmux attach  # session already exists
  else
    exec tmux new -s "unnamed session"
  fi
}

if [[ -z "$WITHOUT_TMUX"                   # override variable not set
  && -z "$TMUX"                            # not inside tmux session
  && -z "$TERMINAL_EMULATOR"               # not inside emulator like PyCharm
  && -z "$INTELLIJ_ENVIRONMENT_READER"     # not inside JetBrains's env reader
  ]]; 
then

    # tgo
    echo "(Reminder: start TMUX with tgo)"

fi

#########################################################################################################
# oh-my-zsh presets
#########################################################################################################

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


#########################################################################################################
# Functions and aliases
#########################################################################################################

plugins=(
  zsh-autosuggestions
  zsh-vi-mode
  zsh-abbr
  zsh-syntax-highlighting # must be last!
)

# The following function ensures zsh-vi-mode (zvm) doesn't break zsh-abbr
function zvm_after_init() {
  # fuzzy file finding
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  _abbr_bind_widgets
}

# Load plugs
source $ZSH/oh-my-zsh.sh

# ensure abbrs from zsh-abbr are recognized and highlighted green
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(regexp)
ZSH_HIGHLIGHT_REGEXP=('^[[:blank:][:space:]]*('${(j:|:)${(Qk)ABBR_REGULAR_USER_ABBREVIATIONS}}')$' fg=green)
ZSH_HIGHLIGHT_REGEXP+=('[[:<:]]('${(j:|:)${(Qk)ABBR_GLOBAL_USER_ABBREVIATIONS}}')$' fg=green)


#########################################################################################################
# Functions (note: abbreviations are stored via zsh-abbr in $ABBR_USER_ABBREVIATIONS_FILE)
#########################################################################################################

mdcd ()
{
    mkdir -p -- "$1" && cd -P -- "$1"
}

function git_main_branch() {  # used by gcom
  if [[ -n "$(git branch --list main)" ]]; then
    echo main
  else
    echo master
  fi
}

#########################################################################################################
# Inits and setups (e.g. pyenv or brew)
#########################################################################################################

# starship prompt/theme
eval "$(starship init zsh)"

# zoxide ('z' replacement for 'cd')
eval "$(zoxide init zsh)"

# rbenv
source $HOME/.zshenv
eval "$(rbenv init - zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

# homebrew
export HOMEBREW=$(brew --prefix) 
export LDFLAGS="$LDFLAGS -L$HOMEBREW/lib" 
export CFLAGS="$CFLAGS -I$HOMEBREW/include" 
export CPPFLAGS="$CPPFLAGS -I$HOMEBREW/include"
export LLVM_SYS_170_PREFIX=$(brew --prefix llvm)


#########################################################################################################
# Dotfiles: track-dotfile and untrack-dotfile
#########################################################################################################

track-dotfile() {
    emulate -L zsh
    setopt local_options no_err_exit unset pipefail

    # Check for correct number of arguments
    if (( $# != 1 )); then
        print "Usage: track-dotfile <path_to_file_or_directory>" >&2
        print "Example: track-dotfile ~/.config/tmux/tmux.conf" >&2
        print "         track-dotfile ~/.config/nvim" >&2
        return 1
    fi

    local source_path="${1:A}"  # Resolve to absolute path
    local home_dir="${HOME:A}"  # Resolve home directory to absolute path
    local dotfiles_dir="${home_dir}/dotfiles"

    # Check if the source is within the home directory
    if [[ "$source_path" != ${home_dir}/* ]]; then
        print "Error: ${source_path} is not within your home directory." >&2
        print "Only files and directories within ${home_dir} can be tracked." >&2
        return 1
    fi

    local relative_path="${source_path#$home_dir/}"
    local target_path="${dotfiles_dir}/${relative_path}"

    # Check if the source exists
    if [[ ! -e "$source_path" ]]; then
        print "Error: ${source_path} does not exist." >&2
        return 1
    fi

    # Check if it's already in the dotfiles directory
    if [[ "$source_path" == ${dotfiles_dir}/* ]]; then
        print "Error: ${source_path} is already in the dotfiles directory." >&2
        return 1
    fi

    # Create the parent directory in the dotfiles repo
    mkdir -p "${target_path:h}" || { print "Error: Could not create directory ${target_path:h}" >&2; return 1; }

    # Move the file or directory to the dotfiles repo
    mv "$source_path" "$target_path" || { print "Error: Could not move ${source_path} to ${target_path}" >&2; return 1; }

    # Use Stow to create the symlink
    (cd "$dotfiles_dir" && stow --restow . --target="$home_dir") || {
        print "Error: Stow failed. Restoring original file/directory." >&2
        mv "$target_path" "$source_path"
        return 1
    }

    print "Successfully tracked ${source_path} in dotfiles repository."
    print "A symlink has been created at the original location using Stow."
    print "Next steps:"
    print "1. Review the tracked item: ${target_path}"
    print "2. Commit the changes to ~/dotfiles"
}

untrack-dotfile() {
    emulate -L zsh
    setopt local_options no_err_exit unset pipefail

    # Check for correct number of arguments
    if (( $# != 1 )); then
        print "Usage: untrack-dotfile <path_to_file_or_directory>" >&2
        print "Example: untrack-dotfile ~/.config/tmux/tmux.conf" >&2
        print "         untrack-dotfile ~/.config/nvim" >&2
        return 1
    fi

    local source_path="${1:A}"  # Resolve to absolute path
    local home_dir="${HOME:A}"  # Resolve home directory to absolute path
    local dotfiles_dir="${home_dir}/dotfiles"

    # Check if the source is within the home directory
    if [[ "$source_path" != ${home_dir}/* ]]; then
        print "Error: ${source_path} is not within your home directory." >&2
        print "Tracked files and directories are always within ${home_dir}." >&2
        return 1
    fi

    local relative_path="${source_path#$home_dir/}"
    local target_path="${dotfiles_dir}/${relative_path}"

    # Check if the source exists
    if [[ ! -e "$source_path" ]]; then
        print "Error: ${source_path} does not exist." >&2
        return 1
    fi

    # If the source is a link, just materialize it
    if [[ -L "$source_path" ]]; then
        mv "$target_path" "$source_path" || { print "Error: Could not move ${target_path} to ${source_path}" >&2; return 1; }
        print "Successfully untracked ${source_path} by replacing the symlink with the actual file/directory."
        return 0
    fi

    print "TODO: Couldn't untrack $source_path."
    print "It's not a symlink. Rather, one of its parent folders is a symlink."
    print "I don't have code to handle that yet."
}


########################################################################################################
# Everything below this line hasn't been organized 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


