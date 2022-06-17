# Dot-Files
My dot files for dev env setups

## First Steps - do in order
1) install iterm + zprezto
2) Clone dot-files repo
3) Install gnu-stow
  * `brew install stow` 
4) Use stow to install symlinks for desired dirs
  * stow -v -R -t ~ git
  * `-t ~` means the stow root will be at `~`.
5) install karabiner elements and make dvorak our boy. also update apple modifier keys

* iterm
  * solarized light should be there
  * add fonts
  + brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font
    * after ^ make sure iterm uses the new font
    * make sure ligatures are activated
  + use `iterm_profile` json config file to import profile *untested* (otherwise set it in profiles -> text)
* git
  + git config --global core.excludesFile '~/.gitignore_global'
* zsh
* zprezto
* install nvm and node
  * nvm default should be set so it persists between sessions
* neovim
	+ brew install neovim
	+ :PackerInstall
	+ TSInstall all

### Other Dependencies
---
* install vale https://github.com/errata-ai/vale
  - `vale sync`
* install wollemi from source
* `brew install alt-tab` change the controls for opening alt tab to be GUI + tab so that it overrides the default GUI + tab
* brew install ripgrep
* brew install fd
*  brew install derailed/k9s/k9s
* brew install tree
* brew install git-lfs
* brew install grpcurl
* go install github.com/fullstorydev/grpcui/cmd/grpcui@latest
* ssh-add -K ~/.ssh/id_rsa
* go install github.com/mgechev/revive@latest
* neobundle
* zsh
* zprezto
  - custom theme called `garret_prompt_setup`
  - zsh autosuggest
* A VM, was virtualbox but it's an annoying tool to bother with / manage
  - might not need now depending on OS and containerless images
* docker
  - docker for mac > docker toolbox
* gcloud sdk
* golang
  - Download go from golang website
* https://github.com/hnarayanan/shpotify
