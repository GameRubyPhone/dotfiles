#!/bin/bash
shell_files=( tat )
for i in "${array[@]}"
do
  sudo ln -s ~/dotfiles/bin/$i /usr/local/bin/$i
done
