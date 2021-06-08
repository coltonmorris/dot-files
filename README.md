# Dot-Files
My dot files for easy dev env setups

## Copy Script
---

The `install.sh` script should be ran after installing the following dependencies:
* iterm
* git
* neobundle
* zsh
* zprezto

It creates symbolic links in your home directory pointing to the files in this repo.

TODO: adding files to the files directory is ugly. You can't just add a new dependency to your home directory and then add it to the list in the install script. You have to move that dependency to the files directory first, then run the install script. Quite ugly.


### Dependencies
---
* mac programmers dvorak
  - no need to install the drivers, just download karabiner elements
  - under complex modification add rule from internet.
  - remember that any keyboard modification done through native OS will fuck things up
* notes
  - notational velocity and terminal velocity.
  - the `~/notes` directory stores all of the notes. Use the alias `n` for terminal_velocity
* tmux
  + `brew install tmux`
  + https://github.com/gpakosz/.tmux
  + `brew install reattach-to-user-namespace`
  + Remember to select `Applications in terminal can access clipboard` in iterm preferences
* iterm
  + Fira code font with ligatures
  + use `iterm_profile` json config file to import profile *untested*
* git
* neobundle
* zsh
* zprezto
  - custom theme called `garret_prompt_setup`
  - zsh autosuggest
* Solarized light for shell
  - for gnome: https://github.com/Anthony25/gnome-terminal-colors-solarized
  - for mac: import solarized light theme for iterm
* A VM, was virtualbox but I've been annoyed with them
  - might not be needed now depending on OS
* docker
  - docker for mac > docker toolbox
* docker-machine
* gcloud sdk
  - After gcloud is installed, use it to download kubernetes
  - Also download helm
  - Use this to download kubectl
* node and npm
  - ```brew install node```
* golang
  - Download go from golang website
* grpc
* protobuf
* python and pip
* google-chrome
  - Ad block plus
  - Cvim
  - EditThisCookie
  - Advanced REST client
  - ARC cookie exchange
  - Markdown Preview Plus
  - React Developer Tools
  - Redux DevTools
  - Solarized Light Theme
* https://github.com/hnarayanan/shpotify
