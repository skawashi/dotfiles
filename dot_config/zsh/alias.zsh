#################
# Alias setting #
#################
## .zshrc 読み込み
alias z='source ~/.zshrc'

## confing file edit
alias vz='vim ~/.zshrc'
alias vv='vim ~/.config/nvim/'
alias vt="vim ~/.tmux.conf"
alias vomz='vim ~/.oh-my-zsh'
alias vd='vim ~/.vim/dein.toml'
alias vvi='vim ~/.vimrc'

## tmux
alias t='tmux a -t'
alias tt='tmux'
alias ttt='tmux a -d'
alias tkl='tmux kill-session -t'
alias tkla='tmux kill-server'
alias tls='tmux ls'
alias tm='tmuximum'

## EDITOR
alias vi='vi'
alias vim='$EDITOR'
alias nv='nvim'
alias view='nvim -R'
alias vimtime='vim --startuptime ./startup.log'

## normal command
alias ls='exa'
alias l='ls'
alias la='ls -a'
alias lla='ls -la'
alias rm='\rm -i'
alias mv='\mv -i'
alias cp='\cp -i'
alias cat='bat'
alias c='bat'
alias cl='clear'

## Git command
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gd='git diff'
alias gds='git diff --staged'
alias gs='git status'
alias gl='git log'
# alias br='branch'
# alias co='checkout'

## Docker Command
alias dcu='docker compose up'
alias dcud='docker compose up -d'
alias dcd='docker compose down'
alias dcs='docker compose stop'
alias dp='docker ps'
alias dpa='docker ps -a'
alias drac='docker rm $(docker ps -aq)'
alias drai='docker rmi $(docker images -q)'

## Pokemonsay
alias poke="pokemonsay 'Welcome'"

## For confirm to read this file.
alias readalias="echo readalias!"

## available command
# neofetch
