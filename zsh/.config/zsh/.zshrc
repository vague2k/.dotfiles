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
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

###------- OMZ-OPTS -------###

zstyle ':omz:*' aliases no # Skip all oh-my-zsh aliases
zstyle ':omz:update' frequency 7 # Check for oh-my-zsh updates every 7 days
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_CUSTOM=$ZSH/custom # Custom $ZSH/custom folder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# NOTE: too many plugins slow down shell startup.
plugins=(git sudo history zsh-autosuggestions zsh-syntax-highlighting)

###------- SOURCE -------###

source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/.fzf.zsh

###------- ALIAS -------###

alias vimc="cd $XDG_CONFIG_HOME/nvim"
alias vimco="cd $XDG_CONFIG_HOME/nvim && nvim ."
alias zshrc="cd $ZDOTDIR && nvim .zshrc"
alias zshrco="cd $ZDOTDIR && nvim ."
alias zshso="cd $XDG_CONFIG_HOME/zsh && source .zshrc"
alias pull="git pull"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
# Leaving this here incase I ever want to switch back to the p10k theme
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
