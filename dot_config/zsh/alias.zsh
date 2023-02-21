#################
# Alias setting #
#################
## .zshrc 読み込み
alias z='source ~/.zshrc'

## confing file edit
alias vz='vim ${CHEZMOI_DIR}/dot_zshrc'
alias vza='vim ${CHEZMOI_DIR}/dot_config/zsh/alias.zsh'
alias vzi='vim ${CHEZMOI_DIR}/dot_config/zsh/init.zsh'
alias vze='vim ${CHEZMOI_DIR}/dot_config/zsh/env.zsh'
alias vvp='vim ${CHEZMOI_DIR}/dot_config/nvim/lua/plugins.lua'
alias vt='vim ${CHEZMOI_DIR}/dot_tmux.conf'
alias vts='vim ${CHEZMOI_DIR}/dot_config/tmux/statusline.conf'
alias vtu='vim ${CHEZMOI_DIR}/dot_config/tmux/utility.conf'
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

## Ngrok
alias ngrok="~/bin/ngrok"
alias n="ngrok"

## available command
# neofetch

