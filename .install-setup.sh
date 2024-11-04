#!/bin/zsh

# Function to check if SSH key exists
check_ssh_key() {
    if [ -f "$HOME/.ssh/id_rsa.pub" ]; then
        echo "SSH key already exists. Skipping key generation."
        return 1
    fi
    return 0
}

# Function to generate SSH key
generate_ssh_key() {
    read -p "Enter your GitHub email address: " github_email
    ssh-keygen -t rsa -b 4096 -C "$github_email"
    eval "$(ssh-agent -s)"
    ssh-add -K ~/.ssh/id_rsa
    echo "SSH key generated and added to the SSH agent."
}

# Function to add SSH key to GitHub
add_ssh_key_to_github() {
    # Copy the public key to clipboard
    pbcopy < ~/.ssh/id_rsa.pub
    echo "Your SSH public key has been copied to the clipboard."
    echo "Please go to GitHub Settings > SSH and GPG keys, and add a new SSH key."
    echo "Title it 'My MacBook' or any name you prefer."
    read -p "Press Enter after you've added the key to proceed..."
}

# Install Xcode CLI tools
echo "Installing command line tools..."
xcode-select --install

# Install Homebrew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to .zprofile
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> $HOME/.zprofile
source "$HOME/.zprofile"
brew analytics off

# Check for SSH key
check_ssh_key
if [ $? -eq 0 ]; then
    generate_ssh_key
    add_ssh_key_to_github
else
    echo "Using existing SSH key."
fi

# Install essential packages with Homebrew
echo "Installing Homebrew packages..."
brew tap FelixKratz/formulae

# Essentials
echo "Installing Essentials..."
brew install llvm
brew install wget
brew install jq
brew install ripgrep
brew install mas
brew install ifstat
brew install switchaudio-osx
brew install git
brew install gh
brew install n
brew install go
brew install docker
brew install make
brew install unzip
brew install killport
brew install tmux

# Terminal tools
echo "Installing Developer Tools..."
brew install neovim
brew install starship
brew install zsh-autosuggestions
brew install zsh-fast-syntax-highlighting
brew install zoxide

# Nice to have
brew install btop
brew install svim
brew install lazygit
brew install dooit
brew install thefuck
brew install ollama

# Custom HEAD only forks
brew install fnnn --head # nnn fork (changed colors, key mappings)

# Install Brew Casks
echo "Installing Terminals..."
brew install --cask alacritty
brew install --cask kitty

echo "Installing Browers..."
brew install --cask orion
brew install --cask brave-browser
brew install --cask arc

echo "Installing IDEs..."
brew install --cask visual-studio-code
brew install --cask cursor

echo "Installing API Builders..."
brew install --cask bruno
brew install --cask postman

echo "Installing Office Apps..."
brew install --cask slack
brew install --cask zoom
brew install --cask meetingbar

echo "Installing Nice to Have Apps..."
brew install --cask alfred
brew install --cask raycast
brew install --cask bitwarden
brew install --cask yt-music
brew install --cask numi

# Install Mac App Store Apps
echo "Installing Mac App Store Apps..."
mas install 497799835 # xCode

# Installing Fonts and Icons
echo "Installing Fonts and Icons..."
brew install --cask sf-symbols
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono
brew install --cask font-fira-code

if [ ! -d "$HOME/Library/Fonts/SFMono" ]; then
    git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
    mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
    rm -rf /tmp/SFMono_Nerd_Font/
    echo "Fonts installed successfully."
else
    echo "Fonts already installed. Skipping installation."
fi

# Copying and planting configuration files
echo "Planting Configuration Files..."
[ ! -d "$HOME/dotfiles" ] && git clone git@github.com:devtimnbr/dotfiles.git "$HOME/dotfiles"
[ ! -d "$HOME/.config" ] && cp -r "$HOME/dotfiles/.config" "$HOME"
[ ! -f "$HOME/.zshrc" ] && cp "$HOME/dotfiles/.zshrc" "$HOME"
[ ! -f "$HOME/.tmux.conf" ] && cp "$HOME/dotfiles/.tmux.conf" "$HOME"

# Installing LTS Node version
echo "Installing Node LTS version"
sudo n lts

echo "Installation complete!"
echo "Start a new terminal tab or reload the shell with 'source ~/.zshrc'"
