autoload history-search-end

HISTFILE=~/.zsh/history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

setopt hist_ignore_dups
setopt share_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt EXTENDED_HISTORY

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

