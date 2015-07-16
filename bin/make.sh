#!/bin/bash
shell_files=( tat passenger_start passenger_stop  )
for i in "${array[@]}"
do
  sudo ln -s ./$i /usr/local/bin/$i
done
