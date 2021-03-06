# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

WORKON_HOME=~/.virtualenvs

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="my"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias -="cd -"
alias ls="ls -FG"
alias la="ls -a"
alias ll="ls -l"
alias lt="ls -ltr"
alias lla="ls -la"
alias lta="ls -ltra"

zstyle  ':completion:*:*:vim:*:*files' ignored-patterns '*.beam'
zstyle  ':completion:*:*:nvim:*:*files' ignored-patterns '*.beam'

# Set to this to use case-sensitive completion
#CASE_SENSITIVE="true"

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
plugins=(colored-man-pages compleat fasd git git-flow git-prompt \
        history-substring-search sudo virtualenvwrapper wd zsh_reload \
        zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

source ~/.zkbd/$TERM-$VENDOR-$OSTYPE

bindkey -e

# F1-F5 bound to retrieve 1st - 5th argument of previous command
bindkey -s "${key[F1]}" '!:1 '
bindkey -s "${key[F2]}" '!:2 '
bindkey -s "${key[F3]}" '!:3 '
bindkey -s "${key[F4]}" '!:4 '
bindkey -s "${key[F5]}" '!:5 '

bindkey "${key[Backspace]}" backward-delete-char
bindkey "${key[Delete]}" delete-char

autoload -U select-word-style
select-word-style whitespace

bindkey "[D" backward-word
bindkey "[C" forward-word

# Customize to your needs...
export REPORTTIME=5
export EDITOR=vim
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"

HISTSIZE=SAVEHIST=10000
setopt incappendhistory
setopt extendedhistory
setopt histignorealldups
setopt histignorespace
setopt nosharehistory
setopt histnostore

ffg() { find "$1" -type f -exec grep -l "$2" \{\} \; }

zstyle ':completion:*' matcher-list '' '+m:{a-z}={A-Z}' '+m:{A-Z}={a-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

alias glggd='git log --graph --decorate --all --stat'

alias ls='gnuls --color'
ff () { find . -name "*$**" }
ffxg () { find . -name "*$1*" | xargs grep $2 }

ccp() { export CCP_ROOT=~/work/ccp; . $CCP_ROOT/ccp.zsh; cd $CCP_ROOT }

