# assumes github and slash seperated plugin names
github_plugins=(
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-syntax-highlighting
    romkatv/powerlevel10k
)

for plugin in $github_plugins; do
  # clone the plugin from github if it doesn't exist
  if [[ ! -d ${ZDOTDIR}/.zsh_plugins/$plugin ]]; then
    mkdir -p ${ZDOTDIR}/.zsh_plugins/${plugin%/*}
    git clone --depth 1 --recursive https://github.com/$plugin.git ${ZDOTDIR}/.zsh_plugins/$plugin
  fi
  # load the plugin
  for initscript in ${plugin#*/}.zsh ${plugin#*/}.plugin.zsh ${plugin#*/}.sh; do
    if [[ -f ${ZDOTDIR}/.zsh_plugins/$plugin/$initscript ]]; then
      source ${ZDOTDIR}/.zsh_plugins/$plugin/$initscript
      break
    fi
  done
done

# clean up
unset github_plugins
unset plugin
unset initscript
