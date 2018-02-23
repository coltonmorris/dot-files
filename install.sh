#!/bin/bash

mv ~/.vimrc backups/vimrc
ln -s files/vimrc ~/.vimrc

mv ~/.gvimrc backups/gvimrc
ln -s files/gvimrc ~/.gvimrc

mv ~/.vim/solarized-light.itermcolors backups/solarized-light.itermcolors
ln -s files/solarized-light.itermcolors ~/.vim/solarized-light.itermcolors

mv ~/.vim/iterm_profile backups/iterm_profile
ln -s files/iterm_profile ~/.vim/iterm_profile

mv ~/.zpreztorc backups/zpreztorc
ln -s files/zpreztorc ~/.zpreztorc

mv ~/.zshrc backups/zshrc
ln -s files/zshrc ~/.zshrc

mv ~/.zprezto/modules/prompt/functions/prompt_garrett_setup backups/prompt_garrett_setup
ln -s files/prompt_garrett_setup ~/.zprezto/modules/prompt/functions/prompt_garrett_setup

mv ~/.gitignore_global backups/gitignore_global
ln -s files/gitignore_global ~/.gitignore_global

mv ~/.gitconfig backups/gitconfig
ln -s files/gitconfig ~/.gitconfig
