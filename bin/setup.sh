#!/usr/bin/env bash

# Exit immediately if a command fails
set -e

DOTFILES_DIR="$HOME/dotfiles"

echo "Creating configuration directories..."
mkdir -p ~/.config/{vim,tmux,htop,keyd,mutt}

echo "Creating symbolic links for .config applications..."

# Link individual configs or entire folders depending on your structure
# Using -sfn to gracefully overwrite or update existing symlinks/directories
ln -sfn "$DOTFILES_DIR/vim" ~/.config/vim
ln -sfn "$DOTFILES_DIR/tmux" ~/.config/tmux
ln -sfn "$DOTFILES_DIR/htop" ~/.config/htop
ln -sfn "$DOTFILES_DIR/keyd" ~/.config/keyd

echo "Setting up Bash configuration..."
# Backup existing non-symlink .bashrc if it exists
if [ -f ~/.bashrc ] && [ ! -L ~/.bashrc ]; then
    echo "Backing up existing ~/.bashrc to ~/.bashrc.bak"
    mv ~/.bashrc ~/.bashrc.bak
fi

ln -sf "$DOTFILES_DIR/bash/bashrc" ~/.bashrc
ln -sf "$DOTFILES_DIR/git/gitconfig" ~/.gitconfig

echo "Dotfiles setup completed successfully!"
