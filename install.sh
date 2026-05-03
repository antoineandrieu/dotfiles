#!/bin/bash
set -e

# Parse arguments
INSTALL_DEPS=false
for arg in "$@"; do
    case $arg in
        --install-deps)
            INSTALL_DEPS=true
            shift
            ;;
        *)
            ;;
    esac
done

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET=$HOME
OS="$(uname -s)"

echo "Installing dotfiles from $DIR to $TARGET"
echo "Detected OS: $OS"

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

# Symlink for alacritty (use TOML format)
if [ -f "$DIR/alacritty/alacritty.toml" ]; then
    ln -sf "$DIR/alacritty/alacritty.toml" "$TARGET/.config/alacritty/alacritty.toml"
else
    ln -sf "$DIR/alacritty/alacritty.yml" "$TARGET/.config/alacritty/alacritty.yml"
fi

# Symlink for tmux
ln -sf "$DIR/tmux/tmux.conf" "$TARGET/.tmux.conf"

# Symlink for zsh
ln -sf "$DIR/zsh/zshrc" "$TARGET/.zshrc"
ln -sf "$DIR/zsh/antigen.zsh" "$TARGET/.antigen.zsh"

echo ""
echo "Dotfiles installed successfully!"
echo ""

# Install dependencies if flag is set
if [ "$INSTALL_DEPS" = true ]; then
    echo "=== Installing dependencies ==="
    if [ "$OS" = "Darwin" ]; then
        echo "macOS detected - installing via Homebrew..."
        if ! command -v brew &> /dev/null; then
            echo "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew install zsh tmux alacritty neovim
        curl -L git.io/antigen > ~/.antigen.zsh
        echo "Dependencies installed on macOS."
    elif [ "$OS" = "Linux" ]; then
        echo "Linux detected - installing via apt..."
        sudo -S -p '' apt update
        sudo -S -p '' apt install -y zsh tmux neovim xclip
        # Install pyenv
        curl https://pyenv.run | bash
        # Install virtualenvwrapper
        sudo -S -p '' apt install -y virtualenvwrapper
        # Try to install alacritty
        if command -v snap &> /dev/null; then
            sudo -S -p '' snap install alacritty --classic
        elif command -v cargo &> /dev/null; then
            cargo install alacritty
        else
            echo "Alacritty not installed (no snap or cargo). Install manually."
        fi
        curl -L git.io/antigen > ~/.antigen.zsh
        echo "Dependencies installed on Linux."
    else
        echo "Unknown OS. Please install manually: zsh, tmux, alacritty, neovim"
    fi
    echo ""
fi

echo "=== Next Steps ==="
echo ""

# Detect package manager and give appropriate instructions
if [ "$OS" = "Darwin" ]; then
    echo "macOS detected:"
    echo "  - Install Homebrew (if not installed):"
    echo "    /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    echo "  - Install antigen:"
    echo "    curl -L git.io/antigen > ~/.antigen.zsh"
    echo "  - Install packages:"
    echo "    brew install zsh tmux alacritty neovim"
elif [ "$OS" = "Linux" ]; then
    echo "Linux detected:"
    echo "  - Install antigen:"
    echo "    curl -L git.io/antigen > ~/.antigen.zsh"
    echo "  - Install packages (Ubuntu/Debian):"
    echo "    sudo apt install zsh tmux alacritty neovim"
    echo "  - Or (Arch Linux):"
    echo "    sudo pacman -S zsh tmux alacritty neovim"
    echo "  - Install Linuxbrew (optional, for alacritty on Linux):"
    echo "    /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
else
    echo "Unknown OS. Please install manually:"
    echo "  - zsh, tmux, alacritty, neovim"
    echo "  - antigen: curl -L git.io/antigen > ~/.antigen.zsh"
fi

echo ""
echo "  - Set zsh as default shell:"
echo "    chsh -s \$(which zsh)"
echo ""
echo "  - Install vim plugins:"
echo "    Open nvim and run: :PlugInstall"
echo ""

if [ "$OS" = "Darwin" ]; then
    echo "  - For tmux clipboard support:"
    echo "    pbcopy is included with macOS (already configured)"
else
    echo "  - For tmux clipboard support:"
    echo "    Install xclip: sudo apt install xclip"
    echo "    (The tmux config will auto-detect xclip)"
fi
