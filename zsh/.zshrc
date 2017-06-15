# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# chefvm config
eval "$(/Users/tz043867/.chefvm/bin/chefvm init -)"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to 'random', it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME='tao_z_theme'

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE='true'

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# add the alias of the rake command:
alias rake='noglob rake'

# add git alias
alias glf='git log --follow --stat --color'
alias gcos='git checkout stable'
# get recent commit from all branches
# git for-each-ref --sort=-committerdate refs/heads/

alias c='clear'
alias o='open'
alias dockerqs='bash /Applications/Docker/Docker\ Quickstart\ Terminal.app/Contents/Resources/Scripts/start.sh'
alias f='fg'
alias nr='npm run'
alias ns='npm start'
alias rmt='trash-put'
alias rm='echo "This is not the command you are looking for."; false'
alias s='rspec'
alias soz='source ~/.zshrc'
alias v='vi'

alias rnr='react-native'

# Java Home reset
alias jdk6='export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)'
alias jdk7='export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)'
alias jdk8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'

# Java Algorithm 4th
alias j4='java-algs4'
alias jc4='javac-algs4'
alias c4='checkstyle-algs4'
alias f4='findbugs-algs4'

# help ruby script alias
alias h='help'

# rvm alia
alias rgl='rvm gemset list'

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# add fish like autosuggestions, https://github.com/tarruda/zsh-autosuggestions
# Load zsh-syntax-highlighting.
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# print alias to the frontend
_-accept-line () {
    emulate -L zsh
    local -a WORDS
    WORDS=( ${(z)BUFFER} )
    # Unfortunately ${${(z)BUFFER}[1]} works only for at least two words,
    # thus I had to use additional variable WORDS here.
    local -r FIRSTWORD=${WORDS[1]}
    local -r GREEN=$'\e[32m' RESET_COLORS=$'\e[0m'
    [[ "$(whence -w $FIRSTWORD 2>/dev/null)" == "${FIRSTWORD}: alias" ]] &&
        echo -nE $'\n'"${GREEN}Executing $(whence $FIRSTWORD)${RESET_COLORS}"
    zle .accept-line
    # Enable autosuggestions automatically.
    #zle autosuggest-start
}
zle -N accept-line _-accept-line
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
# Set java home path
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home/

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails)

# User configuration

# export PATH="/home/tao/.rvm/gems/ruby-2.1.2@railstutorial_rails_4_0/bin:/home/tao/.rvm/gems/ruby-2.1.2@global/bin:/home/tao/.rvm/rubies/ruby-2.1.2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/tao/.rvm/bin:/home/tao/.rvm/bin:/home/tao/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# import $HOME/bin into $PATH by T.Z

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
# close the keystroke off
stty ixany
stty ixoff -ixon
setopt noflowcontrol
setopt BRACE_CCL
setopt menu_complete

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# install the fazf tool on github: https://github.com/junegunn/fzf
#alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs"
#
# Vi mode

bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
#export KEYTIMEOUT=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export PATH="$HOME/rvm/gems/bin:$PATH:$HOME/rvm/bin" # Add RVM to PATH for scripting
# source $HOME/.rvm/scripts/rvm
#export GEM_HOME="$HOME/rvm/gems" # add gem home
# export GEM_PATH="$HOME/rvm/gems/ruby-2.2.2:$HOME/.rvm/gems/ruby-2.2.2@global"

export NVM_DIR="/Users/tz043867/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# PYTHONPATH opencv2
# ln -s /usr/local/Cellar/opencv/2.4.13.2/lib/python2.7/site-packages/cv.py cv.py
# ln -s /usr/local/Cellar/opencv/2.4.13.2/lib/python2.7/site-packages/cv2.so cv2.so

alias python='/usr/local/bin/python'

alias hgd='hexo g && hexo d'
alias hs='hexo s --debug'
alias py='python3'
alias e='emacs'
