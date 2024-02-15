# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###------- XDG SPEC -------###

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

###------- EXPORTS -------###

export ZSH="$XDG_DATA_HOME/oh-my-zsh"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export ANDROID_HOME="$XDG_DATA_HOME/android"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/.npmrc"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

###------- SOURCE -------###

source $ZDOTDIR/ghplug.zsh
source $ZDOTDIR/.fzf.zsh
source $ZDOTDIR/.zsh_plugins/romkatv/powerlevel10k/powerlevel10k.zsh-theme

###------- ALIAS -------###

alias vimc="cd $XDG_CONFIG_HOME/nvim"
alias vimco="cd $XDG_CONFIG_HOME/nvim && nvim ."
alias zshrc="cd $ZDOTDIR && nvim .zshrc"
alias zshrco="cd $ZDOTDIR && nvim ."
alias zshso="cd $XDG_CONFIG_HOME/zsh && source .zshrc"
alias pull="git pull"
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

###------- PATH -------###
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$CARGO_HOME/bin

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# a smarter cd command, see https://github.com/ajeetdsouza/zoxide for more info
eval "$(zoxide init --cmd cd zsh)"
