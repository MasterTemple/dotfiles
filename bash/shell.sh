eval "$(tv init bash)"
eval "$(starship init bash)"

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init bash)"
fi

source /usr/share/bash-completion/bash_completion

if command -v fzf &> /dev/null; then
  if [[ -f /usr/share/fzf/completion.bash ]]; then
    source /usr/share/fzf/completion.bash
  fi
  if [[ -f /usr/share/fzf/key-bindings.bash ]]; then
    source /usr/share/fzf/key-bindings.bash
  fi
fi

