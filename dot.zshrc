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
bindkey "OA" history-search-backward
bindkey "OB" history-search-forward

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
plugins=(git virtualenv virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/home/gsmith/bin
export REPORTTIME=5
export JAVA_HOME=/usr/local/openjdk7

HISTSIZE=SAVEHIST=10000
setopt incappendhistory
setopt extendedhistory
setopt histignorealldups
setopt nosharehistory
setopt histnostore

if [[ `uname` == "FreeBSD" && $TERM == "xterm" ]]; then
	export TERMCAP='xterm|X11 terminal emulator:@7=\EOF:@8=\EOM:F1=\E[23~:F2=\E[24~:K2=\EOE:Km=\E[M:k1=\EOP:k2=\EOQ:k3=\EOR:k4=\EOS:k5=\E[15~:k6=\E[17~:k7=\E[18~:k8=\E[19~:k9=\E[20~:k;=\E[21~:kI=\E[2~:kN=\E[6~:kP=\E[5~:kd=\EOB:kh=\EOH:kl=\EOD:kr=\EOC:ku=\EOA:am:bs:km:mi:ms:ut:xn:AX:Co#8:co#80:kn#12:li#24:pa#64:AB=\E[4%dm:AF=\E[3%dm:AL=\E[%dL:DC=\E[%dP:DL=\E[%dM:DO=\E[%dB:LE=\E[%dD:RI=\E[%dC:UP=\E[%dA:ae=\E(B:al=\E[L:as=\E(0:bl=^G:cd=\E[J:ce=\E[K:cl=\E[H\E[2J:cm=\E[%i%d;%dH:cs=\E[%i%d;%dr:ct=\E[3g:dc=\E[P:dl=\E[M:ei=\E[4l:ho=\E[H:im=\E[4h:is=\E[!p\E[?3;4l\E[4l\E>:kD=\E[3~:ke=\E[?1l\E>:ks=\E[?1h\E=:le=^H:md=\E[1m:me=\E[m:ml=\El:mr=\E[7m:mu=\Em:nd=\E[C:op=\E[39;49m:rc=\E8:rs=\E[!p\E[?3;4l\E[4l\E>:sc=\E7:se=\E[27m:sf=^J:so=\E[7m:sr=\EM:st=\EH:ue=\E[24m:up=\E[A:us=\E[4m:ve=\E[?12l\E[?25h:vi=\E[?25l:vs=\E[?12;25h:kb:ti=\E[?47h:te=\E[?47l:'
fi

ffg() { find "$1" -type f -exec grep -l "$2" \{\} \; }

