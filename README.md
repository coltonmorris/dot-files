# Dot-Files
My dot files for easy dev env setups

## Setup
1) Clone dot-files repo
2) Install gnu-stow
  * `brew install stow` 
3) Use stow to install symlinks for desired dirs
  * stow -v -R -t ~ git
  * `-t ~` means the stow root will be at `~`.



## TODO consider adding to stow the installation process of these
---
* iterm
  * colors should be loaded using iterm, not sure where they are stored, so cant get stow to work with them
* git
* neobundle
* zsh
* zprezto

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
  + brew install font-fira-mono-nerd-font
  + use `iterm_profile` json config file to import profile *untested* (otherwise set it in profiles -> text)
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
