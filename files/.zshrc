# default tmux load
# [[ $TERM != "screen" ]] && exec tmux

tmux
airhorn

export TERM="xterm-256color"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# alias for push messup
alias 'gitp'=git

# path to neo
export NEO=/Users/colton/go/src/git.tcncloud.net/m/neo/
export NEo=/Users/colton/go/src/git.tcncloud.net/m/neo/
export Neo=/Users/colton/go/src/git.tcncloud.net/m/neo/
export neo=/Users/colton/go/src/git.tcncloud.net/m/neo/

# path to my mono
export MONO=/Users/colton/go/src/github.com/coltonmorris/mono
export mono=/Users/colton/go/src/github.com/coltonmorris/mono

# my own compiled version of vim
alias 'vim'=/usr/local/opt/vim/bin/vim

# brew install thefuck
eval $(thefuck --alias)

# sets up z for fasd
eval "$(fasd --init auto)"
# quick opening files in gvim or vim
alias g='f -e gvim'
alias v='f -e vim'


# autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'
# ctry f to accept autosuggest. use autosuggest-execute to accept and execute in one command
bindkey '^f' autosuggest-accept
bindkey '^w' forward-word

#bazel to path
export PATH=$HOME/bin:/usr/local/bin:$PATH

# vscode to path
export PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/:$PATH

# go to path
export GOPATH="${HOME}/go"
export GOROOT="$(brew --prefix golang)/libexec"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# protoc to path
export LD_LIBRARY_PATH=/usr/local/lib

# create chrome alias
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# gcloud to path 
source /Users/colton/google-cloud-sdk/path.zsh.inc
# gcloud zsh completiton
autoload -U compinit compdef
compinit
source /Users/colton/google-cloud-sdk/completion.zsh.inc


# add homebrew to the completion path
fpath=("/usr/local/bin/" $fpath)

# stop typing cd
setopt AUTO_CD

# Now we can pipe to multiple outputs!
setopt MULTIOS

# This makes cd=pushd
setopt AUTO_PUSHD

# This will use named dirs when possible
setopt AUTO_NAME_DIRS

# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# ignore multiple directories for the stack
setopt PUSHD_IGNORE_DUPS

# If I could disable Ctrl-s completely I would!
setopt NO_FLOW_CONTROL

# Keep echo "station" > station from clobbering station
setopt NO_CLOBBER

# Case insensitive globbing
setopt NO_CASE_GLOB

# Be Reasonable!
setopt NUMERIC_GLOB_SORT

# I don't know why I never set this before.
setopt EXTENDED_GLOB

# stop retrying commands
unsetopt correct_all
unsetopt CORRECT


# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

# oh wow!  This is killer...  try it!
bindkey -M vicmd "q" push-line

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space



# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
