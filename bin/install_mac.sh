#!/bin/bash
echo 'Please install git, vim 7.4+ first, change to home directory'
eval 'cd ~/'

git config --global user.name='Tao Zhang'
git config --global alias.co checkout

function install_program_on_mac() 
{
  while true; do
      read -p "install $1?" yn
      case $yn in
          [Yy]* ) eval $2; break;;
          [Nn]* ) break;;
          * ) echo "Please answer yes(y) or no(n).";;
      esac
  done
}

install_program_on_mac 'zsh' 'brew install zsh zsh-completions'
install_program_on_mac 'dotfiles' 'git clone https://github.com/windse7en/dotfiles.git'
install_program_on_mac 'oh.my.zsh' 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
install_program_on_mac 'fzf search' 'git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; ~/.fzf/install'
install_program_on_mac 'spf13.vim' 'curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh'
install_program_on_mac 'tmux' 'brew install tmux'
install_program_on_mac 'rvm' 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3; \curl -sSL https://get.rvm.io | bash -s stable --ruby'

sudo rm ~/.zshrc ~/.tmux.conf ~/.vimrc.local
sudo ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
sudo ln -s ~/dotfiles/vim/.vimrc.local ~/.vimrc.local
sudo ln -s ~/dotfiles/vim/.vimrc.bundles.local ~/.vimrc.bundles.localk
sudo ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

sh ~/dotfiles/bin/make.sh
