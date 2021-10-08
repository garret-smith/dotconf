# Simple theme based on my old zsh settings.

function get_host {
	echo '@'`hostname -s`''
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{red}%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function hw_init {
    if [ -z "$ENVIRONMENT" ]; then
	echo "%{$fg[red]%}%{✖%G%}"
    else
        echo "%{$fg_bold[green]%}%{✔%G%}"
    fi
}

PROMPT=' '
#RPROMPT='%~$(git_prompt_info)$(virtualenv_info)$(get_host)'
RPROMPT='%F{yellow}%~%f$(git_super_status)%f%b'

