## About

NeoVIM configuration files


## Requirements

* Neovim
* "git" command in $PATH
* nodejs

## How to use it

1. Clone the repository.

     ```
     $ git clone ssh://git@git.b612.io:10022/dotfiles/vim-config.git .vim-config
     ```

2. Synchronize the submodule to have the Dein plugin manager.

    ```
    $ git submodule init && git submodule update
    ```

3. Link with default Neovim configuration repository.
    ```
    $ ln -s /home/$USER/.vim-config /home/$USER/config/nvim 
    ```

4. Install coc packages 
    ```
    $ yarn install --frozen-lockfile
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

9. Open vim and install the plugins

    ```vim
    :call dein#install()
    ```
