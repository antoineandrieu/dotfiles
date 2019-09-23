## About

Configuration files


## Requirements

* Neovim
* tmux
* alacritty
* zsh
* "git" command in $PATH
* nodejs

## How to use it

1. Clone the repository.

     ```
     $ git clone git@github.com:antoineandrieu/dotfiles.git $DIR
     ```

5. Install Javascript linters.

  ```
  $ sudo npm install -g prettier eslint
  ```
For each Javascript projet you need to initialize eslint with this command :
```
eslint --init
```

6. Install shell linter.

  ```
  $ sudo apt install shellcheck
  ```

7. Install python linters.

  ```
  $ sudo apt install python3-flake8 python-flake8
  ```

8. Install ctags.

  ```
  $ sudo apt install exuberant-ctags
  ```
ln -s $DIR/dotfiles/vim ~/.config/nvim
ln  $DIR/dotfiles/alacritty/alacritty.yml .config/alacritty/alacritty.yml
ln -s /home/tonio/Sources/dotfiles/zsh/zshrc ~/.zshrc
