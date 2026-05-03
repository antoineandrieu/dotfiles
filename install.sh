#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET=$HOME

echo "Installing dotfiles from $DIR to $TARGET"

# Create necessary directories
mkdir -p "$TARGET/.config/nvim"
mkdir -p "$TARGET/.config/alacritty"

# Symlinks for vim (neovim)
ln -sf "$DIR/vim/init.vim" "$TARGET/.config/nvim/init.vim"
ln -sf "$DIR/vim/coc-settings.json" "$TARGET/.config/nvim/coc-settings.json"
ln -sf "$DIR/vim/ftplugin" "$TARGET/.config/nvim/ftplugin"
ln -sf "$DIR/vim/syntax" "$TARGET/.config/nvim/syntax"
ln -sf "$DIR/vim/autoload" "$TARGET/.config/nvim/autoload"
ln -sf "$DIR/vim/config" "$TARGET/.config/nvim/config"

# Symlink for alacritty
ln -sf "$DIR/alacritty/alacritty.yml" "$TARGET/.config/alacritty/alacritty.yml"

# Symlink for tmux
ln -sf "$DIR/tmux/tmux.conf" "$TARGET/.tmux.conf"

# Symlink for zsh
ln -sf "$DIR/zsh/zshrc" "$TARGET/.zshrc"
ln -sf "$DIR/zsh/antigen.zsh" "$TARGET/.antigen.zsh"

echo "Dotfiles installed successfully!"
echo ""
echo "Don't forget to:"
echo "  - Install antigen: curl -L git.io/antigen > ~/.antigen.zsh"
echo "  - Set zsh as default shell: chsh -s \$(which zsh)"
echo "  - Install vim plugins: open nvim and run :PlugInstall (if using vim-plug)"
