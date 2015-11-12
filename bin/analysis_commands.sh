#!/bin/bash
tail -n 1000 ~/.zsh_history | sed 's/:[ 0-9]*:0;//g' | sort | uniq -c | sort -n -r | head -n 20
