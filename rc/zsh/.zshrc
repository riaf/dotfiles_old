source ~/.zplug/zplug

zplug "zsh-users/zsh-syntax-highlighting", nice:10

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

_glob_source "$ZDOTDIR/function.d/*.zsh"
_glob_source "$ZDOTDIR/rc.d/*.zsh"
_glob_source '~/.zsh?*/.zshrc'
_glob_source "~/.zsh?*/rc.d/*"
