#!/bin/bash

# macOS Development Environment Setup Script
# For embedded C++, Go, Vue, DevOps, and SysAdmin work

set -e

echo "Setting up macOS development environment..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Essential development tools
echo "Installing essential development tools..."
brew install git
brew install cmake
brew install go
brew install node
brew install postgresql@17

# Essential utilities for shell experience
echo "Installing essential utilities..."
brew install ripgrep
brew install tree
brew install htop

# Install NVM for Node.js version management
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
fi

# Setup directories
echo "Creating development directories..."
mkdir -p ~/go/{bin,src,pkg}
mkdir -p ~/projects/{cpp,go,vue,embedded}

# Set up Git configuration template
echo "Setting up Git configuration..."
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.editor vim

echo ""
echo "Installation complete!"
echo ""
echo "Next steps:"
echo "1. Copy the .zshrc file to your home directory: cp .zshrc ~/.zshrc"
echo "2. Restart your terminal or run: source ~/.zshrc"
echo "3. Configure Git with your details:"
echo "   git config --global user.name 'Your Name'"
echo "   git config --global user.email 'your.email@example.com'"
echo ""