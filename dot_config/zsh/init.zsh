##################
# Option setting
##################
setopt no_beep
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_cd
setopt hist_ignore_dups
setopt share_history
setopt inc_append_history

###################
# History setting
###################
export HSITFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

#区切り文字設定
export WORDCHARS="*?_-.[]~&;=!#$%^()[]<>"

# vimのescapeでノーマルモードへ移行する時間用設定
KEYTIMEOUT=1

###################
# bindkey setting
###################
bindkey "ç" fzf-cd-widget # Opt+c で打たれる文字をバインド
bindkey \^U backward-kill-line # ctrl+u で行頭からカーソル前まで削除

# if [[ -z $TMUX ]] then
#   pokemonsay 'Welcome'
# fi

# tmuxで起動された場合にTERMをtmux.confで設定しているdefault terminalにする。
# そうでなければ、xterm-256color
if [[ -n ${TMUX-} ]];then
    export TERM=tmux-256color
fi

