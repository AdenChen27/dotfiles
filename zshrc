source $HOME/.zsh_aliases

function chpwd() {
    emulate -L zsh
    ll
}

eval $(thefuck --alias heck)
eval $(thefuck --alias bloodyhell)


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/aden/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/aden/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/aden/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/aden/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

