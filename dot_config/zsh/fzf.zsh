###############
# FZF setting
###############
# [ -f ~/.config/.fzf.zsh ] && source ~/.config/.fzf.zsh

# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/shun_ts/.config/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/shun_ts/.config/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/shun_ts/.config/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/shun_ts/.config/fzf/shell/key-bindings.zsh"

export FZF_TMUX=1
export FZF_TMUX_OPTS="-p -w80% -h80%" #[width(%),[heigh(%)]
export FZF_DEFAULT_OPTS='--height 40% --reverse' # --heigh, --reverse, --border
export FZF_COMPLETION_TRIGGER=hoge
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
# export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
# export FZF_CTRL_T_OPTS="--preview 'tree -C {} | head -200'"

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

alias f='fzf-tmux --preview "head -n 100 {}"'

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

