## About

ZSH configuration files


## Requirements

* ZSH.
* "git" command in $PATH

## How to use it

1. Clone the repository.

     ```
     $ git clone ssh://git@git.b612.io:10022/dotfiles/zsh-config.git .zsh-config
     ```

2. Synchonize the submodule to have the Antigen plugin manager.

    ```
    $ git submodule init && git submodule update
    ```

3. Link with default ZSH configuration file.
    ```
    $ ln -s zshrc .zshrc 
    ```
