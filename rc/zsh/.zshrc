source ~/.zplug/init.zsh

# zplug "peco/peco", as:command, from:gh-r, use:"*amd64*"
zplug "mollifier/anyframe"
zplug "mollifier/cd-gitroot"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "b4b4r07/ssh-keyreg"
# zplug "hokaccha/nodebrew", do: "perl nodebrew setup"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions"

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
