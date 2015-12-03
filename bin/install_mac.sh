#!/bin/bash
echo 'Please install git, vim 7.4+ first with lua, change to home directory'
eval 'cd ~/'

git config --global user.name='Tao Zhang'
git config --global alias.co checkout
git config --global alias.br branch

function install_program_on_mac() 
{
  while true; do
      read -p "install $1?" yn
      case $yn in
          [Yy]* ) eval $2; break;;
          [Nn]* ) break;;
          [Qq]* ) exit;;
          * ) echo "Please answer yes(y) or no(n).";;
      esac
  done
}

install_program_on_mac 'zsh' 'brew install zsh zsh-completions'
echo "Please create theme in zsh custom folder and ln -s to tao_z_theme"
install_program_on_mac 'dotfiles' 'git clone https://github.com/windse7en/dotfiles.git'
install_program_on_mac 'oh.my.zsh' 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
install_program_on_mac 'fzf search' 'git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; ~/.fzf/install'
install_program_on_mac 'silver search' 'brew install the_silver_searcher'
install_program_on_mac 'spf13.vim' 'curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh'
install_program_on_mac 'tmux plugin' 'brew install reattach-to-user-namespace'
install_program_on_mac 'tmux' 'brew install tmux'
install_program_on_mac 'rvm' 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3; \curl -sSL https://get.rvm.io | bash -s stable --ruby'
install_program_on_mac 'ctags' 'brew install ctags'

sudo rm ~/.zshrc ~/.tmux.conf ~/.vimrc.local
sudo ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
sudo ln -s ~/dotfiles/vim/.vimrc.local ~/.vimrc.local
sudo ln -s ~/dotfiles/vim/.vimrc.bundle.local ~/.vimrc.bundle.local
sudo ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
sudo ln -s ~/dotfiles/pry/.pryrc ~/.pryrc
sudo mv /usr/bin/ctags /usr/bin/ctags_mac

ln -s /System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc /usr/local/bin

sh ~/dotfiles/bin/make.sh
