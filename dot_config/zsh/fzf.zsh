###############
# FZF setting
###############
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias f='fzf-tmux --preview "head -n 100 {}"'
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
# export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_T_OPTS="--preview 'tree -C {} | head -200'"

fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

