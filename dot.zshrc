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
alias ls="ls -FG"
alias la="ls -a"
alias ll="ls -l"
alias lt="ls -ltr"
alias lla="ls -la"
alias lta="ls -ltra"

zstyle  ':completion:*:*:vim:*:*files' ignored-patterns '*.beam'

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
plugins=(compleat fasd git \
        sudo wd asdf zsh-autosuggestions \
        zsh-syntax-highlighting history-substring-search
        history-substring-search)

# removed plugins: git-prompt

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

zstyle ':completion:*' matcher-list '' '+m:{a-z}={A-Z}' '+m:{A-Z}={a-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

alias glggd='git log --graph --decorate --all --stat'

alias gg='git gui citool'

# alias dv="setxkbmap -device `xinput | sed -n -e 's/.*AT Translated.*id=\([0-9]\+\).*/\1/p'` -layout dvorak; xmodmap ~/dotconf/caps_esc.xmod"
# alias sme="xinput set-prop 'Logitech USB Trackball' 'libinput Scroll Method Enabled' 0 0 1 ; xinput set-prop 'Logitech USB Trackball' 'libinput Button Scrolling Button' 9"
gsettings set org.gnome.desktop.peripherals.trackball scroll-wheel-emulation-button 9

alias dc='docker compose'
alias dcr='docker compose run'
alias dcs='docker compose stop'
alias dcdn='docker compose down'
alias dcud='docker compose up -d'
alias dlf='docker logs -f'
alias dps='docker ps'
dltr() {
        docker inspect --format='{{.LogPath}}' "$1" | xargs sudo truncate -c -s 0
}

alias getip='curl https://ipinfo.io/ip'

alias logseq_upgrade='ls_files=(~/Downloads/Logseq-linux-*.zip(N)); if [[ $#ls_files == 1 ]]; then (echo "Upgrading to $ls_files"; cd ~/logseq; rm -Rf Logseq-linux-x64; unzip -q ~/Downloads/Logseq-linux-*.zip; rm ~/Downloads/Logseq-linux-*.zip); else echo "No download? $ls_files"; fi'
alias zoom_upgrade='pkill zoom; cd ~/Downloads; wget https://zoom.us/client/latest/zoom_amd64.deb; sudo apt install ./zoom_amd64.deb; rm ./zoom_amd64.deb; popd'
alias material_update='cd ~/ext/material-shell; git fetch -p; popd'

alias zsd='sudo systemctl disable zsaservice.service; sudo systemctl disable zstunnel.service'
alias zse='sudo systemctl enable zsaservice.service; sudo systemctl enable zstunnel.service'
alias zsr='sudo systemctl restart zsaservice.service; sudo systemctl restart zstunnel.service'
alias zss='sudo systemctl start zsaservice.service; sudo systemctl start zstunnel.service'
alias zs-restart='sudo systemctl restart zsaservice zstunnel'

#pactl set-default-sink alsa_output.pci-0000_00_1f.3.hdmi-stereo-extra1
pactl set-default-sink alsa_output.pci-0000_00_1f.3.hdmi-stereo
pactl set-default-source alsa_input.usb-Blue_Microphones_Yeti_X_2112SG0153C8_888-000313110306-00.iec958-stereo

# alias ls='gnuls --color'
ff () { find . -name "*$**" }
ffg() { find "$1" -type f -exec grep -l "$2" \{\} \; }
ffxg () { find . -name "*$1*" | xargs grep $2 }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# source ~/hw/.envrc


# pnpm
export PNPM_HOME="/home/garrets/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="/home/garrets/bin:$PATH:/home/garrets/.local/bin:/home/garrets/.akeyless/bin"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_QPA_PLATFORM=wayland
# export GDK_BACKEND=wayland
# export MOZ_ENABLE_WAYLAND=1

