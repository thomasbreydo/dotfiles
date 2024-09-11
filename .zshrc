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
    echo "(Reminder: start TMUX!)"

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
# Everything below this line hasn't been organized 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


