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

PROMPT=' '
#RPROMPT='%~$(git_prompt_info)$(virtualenv_info)$(get_host)'
RPROMPT='%F{yellow}%~%f$(git_prompt_info)%f%b $(virtualenv_info)%n@%B%m%b'

