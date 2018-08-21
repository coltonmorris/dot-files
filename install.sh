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
  ~/.tmux.conf
  ~/.tmux.conf.local
)

DATE=$(date +'%s')

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NO_COLOR='\033[0m'


# create backups dir
mkdir -p backups/$DATE
echo -e "${GREEN}Storing backups in backups/$DATE${NO_COLOR}"
echo ""


# loop through FILES and create sym link for each, as well as a saved backup
echo -e "${GREEN}Saving and linking files...${NO_COLOR}"
for i in "${FILES[@]}"
do

  # if the file exists (sym or real)
  if [ -e $i ]; then
    echo -e "\t${YELLOW}Backing Up: $i${NO_COLOR}"
    # back up locally, making sure not to copy symn links
    cp -LRH $i backups/$DATE/"$(echo $i | sed 's/.*\///')"

    # remove to make room for link
    rm $i
  else
    echo -e "\t${GREEN}Creating: $i${NO_COLOR}"
    # save to backups
    cp files/"$(echo $i | sed 's/.*\///')" backups/$DATE
  fi

  # now create the sym link
  ln -s $(pwd)/files/"$(echo $i | sed 's/.*\///')" $i
done
