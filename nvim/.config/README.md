We conditionally use `terminal_nvim` which is our full fledged nvim setup. the other default setup is pretty bare bones and with no plugins, so that it doesn't mess with cursor/vscode

this is done in our `~/.zshrc` , and vscode/cursor unsets it
```
export NVIM_APPNAME=terminal_nvim
```
