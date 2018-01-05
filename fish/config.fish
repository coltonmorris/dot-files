set fish_key_bindings fish_vi_key_bindings
function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
end

# postgres 
# set -x PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

# go
set -x GOROOT /usr/local/opt/go/libexec
set -x GOPATH ~/go_workspace $GOPATH
set -x PATH $GOPATH/bin $GOROOT/bin $PATH

# create chrome alias
alias chrome google-chrome

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/colton/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/colton/google-cloud-sdk/path.fish.inc'; else; . '/Users/colton/google-cloud-sdk/path.fish.inc'; end; end
