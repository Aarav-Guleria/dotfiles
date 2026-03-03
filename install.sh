#!/usr/bin/env bash

set -e

echo "🔗 Linking dotfiles..."

mkdir -p ~/.config

# Neovim
ln -sf ~/.dotfiles/nvim ~/.config/nvim

# tmux
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

# starship
ln -sf ~/.dotfiles/starship/starship.toml ~/.config/starship.toml

# zsh config folder (if used)
ln -sf ~/.dotfiles/zsh ~/.config/zsh

echo "✅ Dotfiles installed successfully"
