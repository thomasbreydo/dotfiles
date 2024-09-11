# Append each path in ~/.config/PATH.txt in that order
# ====================================================

set -e fish_user_paths
while read -la line
    if string match --regex '^#.*$' $line
        continue # ignore lines that start with a hashtag
    end
    set line (string replace --regex '($HOME|~)' $HOME $line) # expand ~ and $HOME
    fish_add_path -ma $line
end <$HOME/.config/PATH.txt

# rbenv
status --is-interactive; and rbenv init - fish | source

set -Ux fish_color_normal normal # the default color
set -Ux fish_color_command green # for commands
set -Ux fish_color_quote yellow # for quoted blocks of text
set -Ux fish_color_redirection cyan # for IO redirections
set -Ux fish_color_end cyan # for process separators like ';' and '&'
set -Ux fish_color_error red # used to highlight potential errors
set -Ux fish_color_param normal # for regular command parameters
set -Ux fish_color_comment white # used for code comments
set -Ux fish_color_match cyan # used to highlight matching parenthesis
set -Ux fish_color_operator cyan # for parameter expansion operators like '*' and '~'
set -Ux fish_color_escape magenta # used to highlight character escapes like '\n' and '\x70'
set -Ux fish_color_autosuggestion white # used for autosuggestions

set -Ux fish_color_cwd '#ff0000' # IGNORE (current working directory in default prompt)
set -Ux fish_color_user '#ff0000' # IGNORE (current username in some default prompts)
set -Ux fish_color_host '#ff0000' # IGNORE (current host system in some default prompts)

# set -Ux fish_color_search_match        # used to highlight history search matches
# set -Ux fish_pager_color_prefix        # of the prefix string, i.e. the string that is to be completed
# set -Ux fish_pager_color_completion    # of the completion itself
# set -Ux fish_pager_color_description   # of the completion description
# set -Ux fish_pager_color_progress      # of the progress bar at the bottom left corner
# set -Ux fish_pager_color_secondary     # background of the every second completion




# Try opening a tmux session (if not in one already) 
# ==================================================

# if
# 1. WITHOUT_TMUX isn't set and
# 2. we aren't inside a tmux session
# 3. we aren't inside an emulator like PyCharm
# 4. we aren't inside JetBrains's env reader
#if test -z "$WITHOUT_TMUX" -a -z "$TMUX" -a -z "$TERMINAL_EMULATOR" -a -z "$INTELLIJ_ENVIRONMENT_READER"
    #if tmux ls &>/dev/null # if no sessions active
        #exec tmux attach
    #else
        #exec tmux new -s "unnamed session"
    #end
#end


set fish_greeting # hush greeting
fish_vi_key_bindings # use VI keybinds in fish prompt
starship init fish | source # turn on starship theme
zoxide init fish | source # 'z' command


# Set up pyenv
# ============

set -gx PYENV_ROOT $HOME/.pyenv
pyenv init - | source


# Set up brew
# ===========

set -gx HOMEBREW (brew --prefix)
set -gx LDFLAGS "$LDFLAGS -L$HOMEBREW/lib"
set -gx CPPFLAGS "$CPPFLAGS -I$HOMEBREW/include"
set -gx CPPFLAGS "$CPPFLAGS -I$HOMEBREW/include"


function fish_mode_prompt # fix vi cursor (temporary fix)
    switch $fish_bind_mode
        case default
            echo -en "\e[2 q"
        case insert
            echo -en "\e[6 q"
        case replace_one
            echo -en "\e[4 q"
        case visual
            echo -en "\e[2 q"
        case '*'
            echo -en "\e[2 q"
    end
end
