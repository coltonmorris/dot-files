#!/bin/bash

# our dot files. These will be moved to backups, then sym links will take their place
FILES=(
  ~/.vim/solarized-light.itermcolors
  ~/.gvimrc
  ~/.vimrc
  ~/.vim/iterm_profile 
  ~/.zpreztorc 
  ~/.zshrc 
  ~/.zprezto/modules/prompt/functions/prompt_garrett_setup 
  ~/.gitignore_global 
  ~/.gitconfig 
)

COUNTER=$[$(cat backups/COUNTER)]

# if counter gets too large, reset it to 0
if [ $COUNTER -gt 20 ]; then
  echo "0" > backups/COUNTER
  COUNTER=0
fi

# create/overwrite our backup files
rm -rf backups/$COUNTER
mkdir backups/$COUNTER
echo "Storing backups in backups/$COUNTER"

for i in "${FILES[@]}"
do
  # if the file exists (either sym link or real) do not try to backup 
  if [ -e $i ]; then
    echo $i

    # back up locally, making sure not to copy symn links
    cp -LRH $i backups/$COUNTER/"$(echo $i | sed 's/.*\///')"

    # remove to make room for link
    rm $i
  fi
  ln -s $(pwd)/files/"$(echo $i | sed 's/.*\///')" $i
done

echo "$[$(cat backups/COUNTER) + 1]" > backups/COUNTER
