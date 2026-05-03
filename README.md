# Dotfiles

Personal configuration files for Unix-like systems.

## Contents

| Directory | Description |
|-----------|-------------|
| `zsh/` | Zsh shell configuration with antigen plugin manager |
| `vim/` | Neovim configuration with plugins |
| `tmux/` | Tmux terminal multiplexer config |
| `alacritty/` | Alacritty terminal emulator config (Dracula theme) |

## Requirements

- [Neovim](https://neovim.io/) (v0.5+)
- [tmux](https://github.com/tmux/tmux)
- [Alacritty](https://alacritty.org/)
- [zsh](https://www.zsh.org/)
- [Git](https://git-scm.com/) in `$PATH`
- [Node.js](https://nodejs.org/) (for LSP servers)

## Quick Install

```bash
git clone git@github.com:antoineandrieu/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Then install the antigen plugin manager:

```bash
curl -L git.io/antigen > ~/.antigen.zsh
```

## Manual Installation

If you prefer to set up symlinks manually:

```bash
# Neovim
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/vim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s ~/dotfiles/vim/ftplugin ~/.config/nvim/ftplugin
ln -s ~/dotfiles/vim/syntax ~/.config/nvim/syntax
ln -s ~/dotfiles/vim/autoload ~/.config/nvim/autoload
ln -s ~/dotfiles/vim/config ~/.config/nvim/config

# Alacritty
mkdir -p ~/.config/alacritty
ln -s ~/dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

# tmux
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

# zsh
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/antigen.zsh ~/.antigen.zsh
```

Set zsh as default shell:

```bash
chsh -s $(which zsh)
```

## Post-Install Steps

### JavaScript Development
```bash
npm install -g prettier eslint
```

### Python Development
```bash
pip install flake8
```

### Install Neovim Plugins
Open Neovim and run:
```
:PlugInstall
```
(or the appropriate command for your plugin manager)

## Security Notes

- Review `zsh/zshrc` before installing - it contains paths specific to the author's setup
- SSH keys referenced in config should be adjusted for your system
- The `antigen.zsh` file is a third-party plugin manager - verify its source if concerned
- Paths containing usernames (e.g., `/home/antoine/`) need to be updated for your system

## Updating

To sync changes across machines:

```bash
cd ~/dotfiles
git pull
```

Changes to symlinked files take effect immediately (restart applications as needed).

## License

MIT
