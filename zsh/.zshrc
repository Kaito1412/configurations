#
# ~/.zshrc
#

function error_handler {
  if [ $? -eq 127 ]; then
     sl
 fi
}

PATH=$PATH:$HOME/.scripts
GEM_HOME=$(ls -t -U | ruby -e 'puts Gem.user_dir')
GEM_PATH=$GEM_HOME
export PATH=$PATH:$GEM_HOME/bin
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

dynamic_prompt

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
