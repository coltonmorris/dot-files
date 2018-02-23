#!/bin/bash

mv ~/.vimrc backups/vimrc
ln -s ~/dot-files/files/vimrc ~/.vimrc

mv ~/.gvimrc backups/gvimrc
ln -s ~/dot-files/files/gvimrc ~/.gvimrc

mv ~/.vim/solarized-light.itermcolors backups/solarized-light.itermcolors
ln -s ~/dot-files/files/solarized-light.itermcolors ~/.vim/solarized-light.itermcolors

mv ~/.vim/iterm_profile backups/iterm_profile
ln -s ~/dot-files/files/iterm_profile ~/.vim/iterm_profile

mv ~/.zpreztorc backups/zpreztorc
ln -s ~/dot-files/files/zpreztorc ~/.zpreztorc

mv ~/.zshrc backups/zshrc
ln -s ~/dot-files/files/zshrc ~/.zshrc

mv ~/.zprezto/modules/prompt/functions/prompt_garrett_setup backups/prompt_garrett_setup
ln -s ~/dot-files/files/prompt_garrett_setup ~/.zprezto/modules/prompt/functions/prompt_garrett_setup

mv ~/.gitignore_global backups/gitignore_global
ln -s ~/dot-files/files/gitignore_global ~/.gitignore_global

mv ~/.gitconfig backups/gitconfig
ln -s ~/dot-files/files/gitconfig ~/.gitconfig
