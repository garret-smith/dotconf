# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="my"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias -="cd -"
alias ..="cd .."
alias ...="cd ../.."

alias ls="ls -FG"
alias la="ls -a"
alias ll="ls -l"
alias lt="ls -ltr"
alias lla="ls -la"
alias lta="ls -ltra"

# F1-F4 bound to retrieve 1st - 4th argument of previous command
bindkey -s 'OP' '!:1 '
bindkey -s 'OQ' '!:2 '
bindkey -s 'OR' '!:3 '
bindkey -s 'OS' '!:4 '

# up arrow key search history backward, down arrow key search forward
bindkey "OA" history-beginning-search-backward
bindkey "OB" history-beginning-search-forward

zstyle  ':completion:*:*:vim:*:*files' ignored-patterns '*.beam'

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git virtualenv virtualenvwrapper colored-man zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:~/bin
export REPORTTIME=5
export EDITOR=vim

HISTSIZE=SAVEHIST=10000
setopt incappendhistory
setopt extendedhistory
setopt histignorealldups
setopt nosharehistory
setopt histnostore

ffg() { find "$1" -type f -exec grep -l "$2" \{\} \; }

source ~/.zshrc_local

