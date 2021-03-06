#!/bin/bash

# our dot files. These will be moved to backups, then sym links will take their place
# NOTE THIS HAS BEEN FAILING AT COPYING THE FILES. SAVE A COPY
FILES=(
  ~/.vim/solarized-light.itermcolors
  ~/.gvimrc
  ~/.vimrc
  ~/.vim/iterm_profile 
  ~/.zpreztorc 
  ~/.zshrc 
  ~/.zprezto/modules/prompt/functions/prompt_garrett_setup 
  ~/.zprezto/modules/prompt/functions/_bazel
  ~/.zhistory
  ~/.gitignore_global 
  ~/.gitconfig 
  ~/.tmux
  ~/.tvrc
  ~/notes
  ~/.config/nvim/init.vim
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
echo -e "${GREEN}Saving and linking files to ./backups/$DATE...${NO_COLOR}"
for i in "${FILES[@]}"
do

  # if the file exists (sym or real)
  if [ -e $i ]; then
    echo -e "\t${YELLOW}Backing Up: $i${NO_COLOR}"
    # back up locally, making sure not to copy symn links
    cp -LRH $i backups/$DATE/"$(echo $i | sed 's/.*\///')"

    # remove to make room for link
    rm -r $i
  else
    echo -e "\t${GREEN}Creating: $i${NO_COLOR}"
    # save to backups
    cp -R files/"$(echo $i | sed 's/.*\///')" backups/$DATE
  fi

  # now create the sym link
  ln -s $(pwd)/files/"$(echo $i | sed 's/.*\///')" $i
done
