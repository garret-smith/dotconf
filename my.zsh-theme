# Simple theme based on my old zsh settings.

function get_host {
	echo '@'`hostname -s`''
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

PROMPT=' '
RPROMPT='%~$(git_prompt_info)$(virtualenv_info)$(get_host)'

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"

