#!/bin/sh

###----- APT UPDATE -----###
echo -e "\e[1;32mUpdating packages...\e[0m"
sleep 1
sudo apt update

###----- REQUIRED DEPS -----###
echo -e "\e[1;32mInstalling required dependencies...\e[0m"
sleep 2
sudo apt install ninja-build gettext cmake unzip curl fzf fd-find stow zsh -y
sleep 1

###----- INSTALL GH CLI -----###
echo -e "\e[1;32mAdding GitHub CLI repository...\e[0m"
sleep 2
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
echo -e "\e[1;32mUpdating package list...\e[0m"
sleep 2
sudo apt update
sleep 1
echo -e "\e[1;32mInstalling GitHub CLI...\e[0m"
sleep 2
sudo apt install gh -y
sleep 1
echo -e "\e[1;32mLogin to github using CLI...\e[0m"
gh auth login

###----- CLONE .DOTFILES -----###
echo -e "\e[1;32mCloning .dotfiles and stowing...\e[0m"
sleep 2
gh repo clone vague2k/.dotfiles
cd ~/.dotfiles

###----- STOW APPROPRIATE .DOTFILES -----###
stow zsh
stow nvim
stow npm
stow ignore

###----- INSTALL GOLANG -----###
echo -e "\e[1;32mInstalling GoLang...\e[0m"
sleep 2
mkdir ~/Downloads
cd ~/Downloads
wget https://golang.org/dl/go1.21.6.linux-amd64.tar.gz -O go1.21.6.linux-amd64.tar.gz
tar -xzf go1.21.6.linux-amd64.tar.gz
mkdir -p ~/.local/share
mv go ~/.local/share/
export PATH=$PATH:~/.local/share/go/bin
cd ~
sleep 1

###----- INSTALL NODE-JS -----###
echo -e "\e[1;32mInstalling Node-JS.\e[0m"
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt install -y nodejs
npm install -g typescript typescript-language-server
sleep 1

###----- INSTALL NVIM-NIGHTLY -----###
echo -e "\e[1;32mCreating and navigating to Documents/GitHub/apps directory...\e[0m"
mkdir -p ~/Documents/GitHub/apps
cd ~/Documents/GitHub/apps
sleep 2
echo -e "\e[1;32mBuilding Neovim nightly from source in Documents/GitHub/apps...\e[0m"
sleep 2
git clone https://github.com/neovim/neovim.git \
&& cd neovim \
&& git checkout nightly \
&& make CMAKE_BUILD_TYPE=RelWithDebInfo \
&& sudo make install
cd ~
sleep 1

echo -e "\e[1;32mDone.\e[0m"
echo