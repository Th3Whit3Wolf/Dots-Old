# Sources files in directory
if [[ -d ~/.shell/scripts ]]; then
    fpath=(~/.shell/scripts $fpath)
    for function_file in ~/.shell/scripts/*
    do
        autoload -Uz ${function_file##*/}
    done
    unset function_file
	autoload -Uz compinit
fi

for dump in ~/.zcompdump(N.mh+24); do
	compinit
done
compinit -C

# forces zsh to realize new commands
zstyle ':completion:*' completer _oldlist _expand _complete _match _ignored _approximate
# select completions with arrow keys
zstyle ':completion:*' menu select
# group results by category
zstyle ':completion:*' group-name ''
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# rehash if command not found (possibly recently installed)
zstyle ':completion:*' rehash true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh
#zstyle ':urlglobber' url-other-schema

# Source alliases, exports, etc
[[ -f ~/.shell/aliasrc ]] && . ~/.shell/aliasrc
[[ -f ~/.shell/distro ]] && . ~/.shell/distro
[[ -f ~/.shell/misc ]] && . ~/.shell/misc
[[ -f ~/.shell/sys ]] && . ~/.shell/sys
[[ -f ~/.shell/typos ]] && . ~/.shell/typos
[[ -f ~/.zsh_plugins.sh ]] && . ~/.zsh_plugins.sh
[[ -f /opt/git/git-subrepo/.rc ]] && . /opt/git/git-subrepo/.rc
zmodload -i zsh/complist
################################################
#                 ENVIRONMENT                  #
################################################
setopt always_to_end        # move cursor to end if word had one match
#setopt auto_cd              # cd by typing directory name if it's not a command
setopt auto_list            # automatically list choices on ambiguous completion
setopt auto_menu            # automatically use menu completion
setopt correct_all          # autocorrect commands

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

unsetopt nomatch

setopt append_history
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks   # remove superfluous blanks from history items
setopt inc_append_history   # save history entries as soon as they are entered
setopt share_history        # share history between different instances
setopt correct_all          # autocorrect commands
setopt interactive_comments # allow comments in interactive shells
setopt complete_aliases

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
################################################
#                    ALIASES                   #
################################################
alias ali='alias | bat --style=numbers,grid -l cpp'
alias antibupdate='antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh'
################################################
#                 KEYBINDINGS                  #
################################################
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# backward and forward word with option+left/right
bindkey '^[^[[D' backward-word
bindkey '^[b' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[f' forward-word

# to to the beggining/end of line with fn+left/right or home/end
bindkey "${terminfo[khome]}" beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey '^[[F' end-of-line

# delete char with backspaces and delete
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char
bindkey '^?' backward-delete-char
###############################################################
#    TMUX 
###############################################################
export TERM=xterm-256color
POWERLEVEL9K_IGNORE_TERM_COLORS=true
################################################################
#    PROMPT    #     #    PROMPT    #     #    PROMPT    #     #
################################################################
## Font mode for powerlevel9k/powerlevel10k
	POWERLEVEL9K_MODE="nerdfont-complete"

# Set name of the theme to load.
ZSH_THEME=powerlevel10k/powerlevel10k
#ZSH_THEME="powerlevel9k/powerlevel9k"
#Icon config
POWERLEVEL9K_SUB_ICON='\UF07C'
POWERLEVEL9K_FOLDER_ICON='\UF07B'

# Separators
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0BC'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$''

# Context
DEFAULT_USER="king"
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='magenta'
POWERLEVEL9K_CONTEXT_TEMPLATE="%F{white}%n %F{magenta}\uf300"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="091"
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="blue"

# Dirs
POWERLEVEL9K_DIR_HOME_BACKGROUND='magenta'
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='magenta'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='11'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='6'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# VCS icons
POWERLEVEL9K_VCS_GIT_ICON=$'\uf1d3'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113'
POWERLEVEL9K_VCS_STAGED_ICON="\u00b1"
POWERLEVEL9K_VCS_UNTRACKED_ICON="\u25CF"
POWERLEVEL9K_VCS_UNSTAGED_ICON="\u00b1"
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON="\u2193"
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON="\u2191"

# VCS colours
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='0'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='magenta'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='0'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='magenta'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='0'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='magenta'

# VCS CONFIG
POWERLEVEL9K_SHOW_CHANGESET=true

# Time
POWERLEVEL9K_TIME_FORMAT="%D{%T \uF017}" #  15:29:33
POWERLEVEL9K_TIME_FOREGROUND="white"
POWERLEVEL9K_TIME_BACKGROUND="magenta"

# Command Exec Time
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='clear'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='090'

# Load
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="0"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="0"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="0"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="white"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="white"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="white"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="013"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="6"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="magenta"

# Ram
POWERLEVEL9K_RAM_BACKGROUND="magenta"
POWERLEVEL9K_RAM_FOREGROUND="white"
POWERLEVEL9K_RAM_ELEMENTS=(ram_free)

# Prompt elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context ram load dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time)
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD="0"
