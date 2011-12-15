################################################################################
# functions
source $HOME/.zsh/functions


################################################################################
# ENV
#
export TERM=xterm-256color
export EDITOR=vim
export PATH=$HOME/local/bin:$PATH
export LANG=ja_JP.UTF-8


################################################################################
# switch env
if [[ $OSTYPE == darwin* ]]; then
    source $HOME/.zsh/darwin
else
    source $HOME/.zsh/linux
fi


################################################################################
# git flow
source $HOME/.zsh/git-flow-completion/git-flow-completion.zsh
alias gf='git flow'


################################################################################
# extra settings
if [ -f $HOME/.zsh/extras ]; then
    source $HOME/.zsh/extras
fi


################################################################################
# Default shell configuration

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no beep sound when complete list displayed
#
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes 
#   to end of it)
#
bindkey -e
bindkey "^?" backward-delete-char

# 色を使う
autoload -Uz colors
colors

# lsにも色表示
export CLICOLOR=1;

# プロンプトに色付けする
setopt prompt_subst

# 濁点 OSX
setopt COMBINING_CHARS


################################################################################
# Command history configuration
HISTFILE=~/.zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt EXTENDED_HISTORY


################################################################################
# Completion configuration
fpath=(~/.zshfunc $fpath)
autoload -U compinit
compinit -u

# 補完の時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


################################################################################
# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

bindkey "^r" history-incremental-search-backward
function chpwd() { ls }


################################################################################
# dabbrev
HARDCOPYFILE=$HOME/.zsh/screen-hardcopy
touch $HARDCOPYFILE

dabbrev-complete () {
        local reply lines=80
        screen -X eval "hardcopy -h $HARDCOPYFILE"
        reply=($(sed '/^$/d' $HARDCOPYFILE | sed '$ d' | tail -$lines))
        compadd - "${reply[@]%[*/=@|]}"
}

zle -C dabbrev-complete menu-complete dabbrev-complete
bindkey '^o' dabbrev-complete
bindkey '^o^_' reverse-menu-complete


################################################################################
# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end


################################################################################
# vcs_info
if autoload +X vcs_info 2> /dev/null; then
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' formats '%s:%b'
    zstyle ':vcs_info:*' actionformats '%s:%b (%a)'
    precmd_vcs_info() {
        psvar[1]=""
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    }
    precmd_functions+=precmd_vcs_info
    RPROMPT="${RPROMPT}%1(V. %F{green}%1v%f.)"
fi


################################################################################
# set prompt
#
PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

