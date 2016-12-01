#!/bin/bash
shell_files=( tat help )
for i in ${shell_files[@]}
do
  # echo $i
  sudo ln -s ~/dotfiles/bin/$i /usr/local/bin/$i
done
