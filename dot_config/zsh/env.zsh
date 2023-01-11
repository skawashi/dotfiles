###################
# 環境変数
###################
## fzf-tmux setting
export FZF_TMUX=1
export FZF_TMUX_OPTS="-p 80%,80%" #[width(%),[heigh(%)]

## nodebrew
export NODE_BREW=$HOME/.nodebrew/current/bin # nodebrew

## NeoVim
export EDITOR='nvim'
export NVIMCONF=$HOME/.config/nvim

## Go lang
export GOPATH=$HOME/code/go

## NODEサイズ
export NODE_OPTIONS="--max-old-space-size=9216"

###################
# PATH
###################
## nodebrew
export PATH=~/.composer/vendor/bin:$PATH
export PATH=$NODE_BREW:/usr/local/bin:$PATH #nodebrew

## Pokemonsay
export PATH=/Users/skawashi/bin:$PATH

## 外部インストールしたtmuxコマンド
export PATH=/usr/local/bin/tmuximum:$PATH

## PHP
# ダウングレード
export PATH=/opt/homebrew/opt/php@7.4/bin:$PATH
export PATH=/opt/homebrew/opt/php@7.4/sbin:$PATH

# phpcs
# export PATH=~/bin/PHP_CodeSniffer/bin:$PATH


