# Enable fuzzy searching with preview
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Set the default preview command
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Enable preview window for various commands
export FZF_CTRL_T_OPTS="--preview-window down:50%"

# FZF Vim key bindings (optional)
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind='ctrl-j:down,ctrl-k:up,ctrl-a:toggle-all'"

if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  export FZF_CTRL_T_COMMAND="fd --type f --hidden --exclude .git"
  export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
fi

