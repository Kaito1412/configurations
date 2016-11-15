#
# ~/.zshrc
#

function error_handler {
  if [ $? -eq 127 ]; then
     sl
 fi
}

PATH=$PATH:$HOME/.scripts
export EDITOR=/usr/bin/vim

trap 'error_handler' ERR

# Options about history
HISTSIZE=1000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
setopt incappendhistory

# Resaltado de sintaxis. Hace Falta tener instalado
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ $- != *i* ]] && return
if [ -f /usr/bin/archey3 ]; then archey3; fi
alias reload="~/.zshrc"
alias ls='ls --color=auto'
alias pacman='pacman --color=always'
alias grep='grep --color'
alias vi='vim'

autoload -U compinit promptinit
autoload -U colors && colors
compinit
promptinit

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey "^[[3~"  delete-char
bindkey "^[3;5~" delete-char
bindkey '\e[1~'  beginning-of-line
bindkey '\e[4~'  end-of-line
bindkey "^e[5~"  beginning-of-history
bindkey "^e[6~"  end-of-history
bindkey '\e[2~'  overwrite-mode
bindkey "^e[5C"  forward-word
bindkey "^eOc"   emacs-forward-word
bindkey "e[5D"   backward-word
bindkey "eOd"    emacs-backward-word
bindkey "ee[C"   forward-word
bindkey "ee[D"   backward-word
bindkey "^H"     backward-delete-word

# Binding in vimmode
bindkey -M vicmd '^R' history-incremental-search-backward
bindkey -M viins 'jk' vi-cmd-mode

# Allow for functions in the prompt.
setopt PROMPT_SUBST

# Autoload zsh functions.
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'

MAIN_COLOR="%{%(#~%{$fg_bold[red]%}~%{$fg_bold[cyan]%})%}"
SYMBOL="$%{$reset_color%} "
# SYMBOL="%{%(#~#~$)%}%{$reset_color%} "
BASE_PROMPT='%n%{$fg_bold[magenta]%}@%{$fg_bold[blue]%}%m %{$fg_bold[magenta]%}%1~$(prompt_git_info)'
NORMAL_PROMPT="${MAIN_COLOR}${BASE_PROMPT} ${MAIN_COLOR}${SYMBOL}"
VI_PROMPT="%{$fg_bold[green]%}$BASE_PROMPT %{$fg_bold[green]%}${SYMBOL}"


PROMPT="${NORMAL_PROMPT}"

dynamic_prompt

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
