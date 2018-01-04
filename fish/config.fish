set fish_key_bindings fish_vi_key_bindings

# postgres 
set -x PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

# go
set -x GOROOT /usr/local/go
set -x GOPATH ~/go_workspace $GOPATH
set -x PATH $GOPATH/bin $GOROOT/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/coltonmorris/go_workspace/src/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/coltonmorris/go_workspace/src/google-cloud-sdk/path.fish.inc'; else; . '/Users/coltonmorris/go_workspace/src/google-cloud-sdk/path.fish.inc'; end; end

# create chrome alias
alias chrome google-chrome
