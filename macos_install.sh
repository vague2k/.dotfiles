#!/bin/sh
# WIP not really sure how to test this? probably should use docker

###----- INSTALL BREW -----###
if command -v brew > /dev/null 2>&1; then
    echo "\033[0;32mHomebrew is already installed.\033[0m"
else
    echo "\033[0;32mHomebrew is not installed. Installing...\033[0m"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

###----- INSTALL GH CLI -----###
echo -e "\e[1;32mInstalling required dependencies from brew...\e[0m"
sleep 2
brew install gh
gh auth login
sleep 1

###----- STOW APPROPRIATE .DOTFILES -----###
echo -e "\e[1;32mStowing appropriate files from .dotfiles...\e[0m"
sleep 2
stow alacritty
stow git
stow zsh
stow nvim
stow npm
stow ignore
stow macOS

###----- LOCAL NVIM PLUGINS -----###
echo -e "\e[1;32mCloning local neovim plugins...\e[0m"
sleep 2
mkdir -p ~/Documents/GitHub
cd ~/Documents/GitHub
gh repo clone vague2k/huez.nvim
gh repo clone vague2k/cd-project.nvim
