# default tmux load
# [[ $TERM != "screen" ]] && exec tmux

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# mkcert root cert location for node. https://github.com/FiloSottile/mkcert#installation
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

#flatc for flatbuffers
export PATH=/Users/colton/go/src/github.com/google/flatbuffers:$PATH

#please
export PATH=$HOME/.please/:$PATH
source <(plz --completion_script)

# share history between terminals
setopt inc_append_history
setopt share_history
export HISTSIZE=100000

export TERM="xterm-256color"

export SPOTIPY_CLIENT_ID='16b6296999424ba6b4ebeee0039f9382'
export SPOTIPY_CLIENT_SECRET='a7de9ecc680b4ea2b791472a528f59c6'
export SPOTIPY_REDIRECT_URI='http://localhost/'

# Bat is a replacement for cat: https://github.com/sharkdp/bat
export BAT_THEME="Monokai Extended Light"

export EDITOR="vim"

# bazel cli tools
alias 'myibazel'=~/bazel-watcher/bazel-out/darwin-fastbuild/bin/ibazel/darwin_amd64_pure_stripped/ibazel 
alias 'ts_auto_deps'=$GOPATH/src/github.com/bazelbuild/rules_typescript/bazel-out/darwin-fastbuild/bin/ts_auto_deps/darwin_amd64_stripped/ts_auto_deps
#bazel to path
export PATH=$HOME/bin:/usr/local/bin:$PATH
#bazel completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

alias 'n'=terminal_velocity

# alias for push messup
alias 'gitp'=git
alias 'gi'=git

# path to neo
export NEO=/Users/colton/gomod/git.tcncloud.net/m/neo/
export NEo=/Users/colton/gomod/git.tcncloud.net/m/neo/
export Neo=/Users/colton/gomod/git.tcncloud.net/m/neo/
export neo=/Users/colton/gomod/git.tcncloud.net/m/neo/

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


# vscode to path
export PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/:$PATH

# go to path
export MODPATH="${HOME}/gomod"
export GOPATH="${HOME}/go"
export GOROOT="$(brew --prefix golang)/libexec"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"


# protoc to path
# export LD_LIBRARY_PATH=/usr/local/lib

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

# for rbenv to change ruby versions it must be below homebrew so that it overrides currently installed ruby
export PATH=$HOME/.rbenv/shims:$PATH


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


# converts plz paths to files in the $neo path 
vimplz () {
  FILES=()
       
  for var in "$@"
  do
    # make sure you have $neo added to your path
    file=($(echo "$neo/$(echo $var | sed 's#//##')"))

    # if there is a colon, replace it with /BUILD.plz
    if [[ $file == *":"* ]]
    then
      file="${file%:*}/BUILD.plz"
    else
      # does not end in a colon
      file="$file/BUILD.plz"
    fi

    FILES+=$file
  done

  vim $FILES
}
