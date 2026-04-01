# Yung Cooltons dot files
Now using gnu stow. A complete game changer.

## First steps - do in order
1) make sure gcc (or equivalent c compiler), golang, node, python, and rust are installed
  * check rust website for details
  * for python, first install uv, then have uv manage the python installations
    - `uv python install`
  * `brew install go`
  * for node
    + copy over `~/.npmrc` and `~/.yarnrc.yml`
1) consider what you will do with your previous ssh keys
1) `brew install yq`
1) install gcloud
1) copy over your ~/.zsh_history
  * also copy over ~/.tcnrc
  * also copy over ~/.secret_zshrc
1) install iterm + zprezto
2) Clone dot-files repo
3) Install gnu-stow
  * `brew install stow` 
4) Use stow to install symlinks for desired dirs
  * stow -v -R -t ~ git
  * `-t ~` means the stow root is at `~`.
5) install karabiner. grab the config from stow. also update apple modifier keys

* iterm
  * solarized light should be there
  * add fonts
  + brew install --cask font-fira-code-nerd-font
    * after ^ make sure iterm uses the new font
    * make sure ligatures are activated
  + use `iterm_profile` json config file to import profile *untested* (otherwise set it in profiles -> text)
* git
  + git config --global core.excludesFile '~/.gitignore_global'
* zsh
  *`brew install fzf`
  *`brew install zoxide`
* `brew install achannarasappa/tap/ticker`
* zprezto
* install nvm and node
  * nvm default should be set so it persists between sessions
* neovim
	+ brew install tree-sitter tree-sitter-cli
	+ brew install neovim
	+ :PackerInstall
	+ TSInstall all

### Other Dependencies
---
* `brew install glab`
* `brew install alt-tab` change the controls for opening alt tab to be GUI + tab so that it overrides the default GUI + tab
* brew install ripgrep
*  brew install derailed/k9s/k9s
* brew install tree
* brew install git-lfs
* brew install grpcurl
* brew install grpcui
* ssh-add -K ~/.ssh/id_rsa
* brew install revive
* zsh
* zprezto
  - custom theme called `garret_prompt_setup`
  - zsh autosuggest
* docker
  - docker for mac > docker toolbox
* gcloud cli
  * copy over ~/.kube and ~/.config/gcloud
* https://github.com/hnarayanan/shpotify
