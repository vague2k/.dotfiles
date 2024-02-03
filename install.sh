#!/bin/sh

sleep 1
echo -e "\e[1;32mPortable dev environment. by vauge2k on github...\e[0m"
sleep 3

# Check if curl is installed, and if not, install it
echo -e "\e[1;32mUpdating packages...\e[0m"
sleep 1
sudo apt update
echo -e "\e[1;32mPackages have been updated.\e[0m"

# Install required dependencies
echo -e "\e[1;32mInstalling required dependencies...\e[0m"
sleep 2
sudo apt install ninja-build gettext cmake unzip curl fzf fd-find stow zsh -y
echo -e "\e[1;32mDeps have been installed.\e[0m"
sleep 1

# Add GitHub CLI repository and install gh
echo -e "\e[1;32mAdding GitHub CLI repository...\e[0m"
sleep 2
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
echo -e "\e[1;32mGitHub CLI has been added...\e[0m"
sleep 1

echo -e "\e[1;32mUpdating package list...\e[0m"
sleep 2
sudo apt update
echo -e "\e[1;32mPackage list has been updated...\e[0m"
sleep 1

echo -e "\e[1;32mInstalling GitHub CLI...\e[0m"
sleep 2
sudo apt install gh -y
echo -e "\e[1;32mGitHub CLI has been installed...\e[0m"
sleep 1

# Run "gh auth login" after gh is installed
echo -e "\e[1;32mLogin to github using CLI...\e[0m"
gh auth login

# Clone the .dotfiles repo
echo -e "\e[1;32mLogin to github using CLI...\e[0m"
gh repo clone vague2k/.dotfiles

# Clone the neovim repo using gh repo clone
echo -e "\e[1;32mCreating and navigating to Documents/GitHub/apps directory...\e[0m"
mkdir -p ~/Documents/GitHub/apps
cd ~/Documents/GitHub/apps
echo -e "\e[1;32mDir created.\e[0m"
sleep 1
echo -e "\e[1;32mBuilding Neovim nightly from source in Documents/GitHub/apps...\e[0m"
sleep 2
git clone https://github.com/neovim/neovim.git \
&& cd neovim \
&& git checkout nightly \
&& make CMAKE_BUILD_TYPE=RelWithDebInfo \
&& sudo make install
echo -e "\e[1;32mNeovim nightly has been installed.\e[0m"
sleep 1


echo -e "\e[1;32mInstalling GoLang...\e[0m"
mkdir ~/Downloads \
&& cd ~/Downloads \
&& wget https://golang.org/dl/go1.21.6.linux-amd64.tar.gz -O go1.21.6.linux-amd64.tar.gz \
&& tar -xzf go1.21.6.linux-amd64.tar.gz \
&& mv go ~/.local/share/ \
&& cd ~
echo -e "\e[1;32mGoLang has been installed.\e[0m"
sleep 1

echo -e "\e[1;32mInstalling Node-JS.\e[0m"
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt install -y nodejs
echo -e "\e[1;32mNode-JS has been installed.\e[0m"
sleep 1

# Install Oh My Zsh with custom plugins and powerlevel10k theme
echo -e "\e[1;32mInstalling Oh My Zsh...\e[0m"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -e "\e[1;32mMoving Oh My Zsh to .local/share...\e[0m"
mkdir -p ~/.local/share \
&& mv ~/.oh-my-zsh ~/.local/share/oh-my-zsh
echo -e "\e[1;32mInstalling Oh My Zsh plugins...\e[0m"
sleep 1
echo -e "\e[1;32mInstalling zsh-autosuggestions...\e[0m"
sleep 1
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.local/share/oh-my-zsh/custom/plugins/zsh-autosuggestions
echo -e "\e[1;32mInstalling zsh-syntax-highlighting...\e[0m"
sleep 1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.local/share/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo -e "\e[1;32mInstalling Powerlevel10k theme...\e[0m"
sleep 1
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.local/share/oh-my-zsh/custom/themes/powerlevel10k
echo -e "\e[1;32mOh My Zsh has been installed.\e[0m"
sleep 1

exit

echo -e "\e[1;32mStowing zsh, nvim...\e[0m"
sleep 1
stow ~/.dotfiles/zsh
stow ~/.dotfiles/nvim

echo -e "\e[1;32mSetting Zsh as the default shell...\e[0m"
chsh -s $(which zsh)
source ~/.config/zsh/.zshrc
echo -e "\e[1;32mZsh is now the default shell.\e[0m"
sleep 1

source ~/.config/zsh/.zshrc
echo -e "\e[1;32mZsh is now the default shell.\e[0m"
sleep 1
