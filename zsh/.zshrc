#
# ~/.bashrc
#

function error_handler {
  if [ $? -eq 127 ]; then
     sl
  fi  
}

trap 'error_handler' ERR

export EDITOR=/usr/bin/vim

[[ $- != *i* ]] && return
if [ -f /usr/bin/archey ]; then archey; fi
alias reload="~/.zshrc"
alias ls='ls --color=auto'
alias pacman='pacman --color=always'
alias doker='sl'

autoload -U compinit promptinit
autoload -U colors && colors
compinit
promptinit

bindkey "^[[3~"          delete-char
bindkey "^[3;5~"         delete-char
bindkey '\e[1~'   beginning-of-line
bindkey '\e[4~'   end-of-line
bindkey "^e[5~" beginning-of-history
bindkey "^e[6~" end-of-history
bindkey '\e[2~'   overwrite-mode
bindkey "^e[5C" forward-word
bindkey "^eOc" emacs-forward-word
bindkey "e[5D" backward-word
bindkey "eOd" emacs-backward-word
bindkey "ee[C" forward-word
bindkey "ee[D" backward-word
bindkey "^H" backward-delete-word

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

PROMPT='%{$fg_bold[cyan]%}%n %{$fg_bold[blue]%}%1~$(prompt_git_info) %{$fg_bold[cyan]%}$ %{$reset_color%}'