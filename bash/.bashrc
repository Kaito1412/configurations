#
# ~/.bashrc
#
export VISUAL=vim
export EDITOR="$VISUAL"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return



function error_handler {
  if [ $? -eq 127 ]; then
      sl
  fi  
}

trap 'error_handler' ERR 

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\[\e[1;36m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;36m\]\$\[\e[m\] \[\e[0;37m\]'
