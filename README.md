dotfiles
=============================================

This repo is for tracking / restoring my various configurations for..

* bash
* vim
* tmux
* python / node / etc..
* mac installs via brew

Quick Install
-------------

```
make clean
make install 
```

**Warning `make clean` will remove your current `.bash`, `.vim`, `.vimrc`, `.bashrc` files / folders.**

Run Vim Locally
-------------------------

In `_vim/.vimrc` change `call vundle#begin()` to `call vundle#begin('path/to/install/plugins')`.

Then, run `vim -u _vim/.vimrc +PluginInstall +qall`.

Every time you call vim, You will need to reference the correct .vimrc (e.g. `vim -u _vim/.vimrc`),
or just move it to your home directory.
