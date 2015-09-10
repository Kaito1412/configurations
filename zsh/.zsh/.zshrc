#
# ~/.bashrc
#

export EDITOR=/usr/bin/vim

[[ $- != *i* ]] && return
alias reload="~/.zshrc"
alias ls='ls --color=auto'
alias pacman='pacman --color=always'

autoload -U compinit promptinit
autoload -U colors && colors
compinit
promptinit


bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
bindkey "^e[1;5~" beginning-of-line
bindkey "^e[4;5~" end-of-line
bindkey "^e[5~" beginning-of-history
bindkey "^e[6~" end-of-history
bindkey "^e[2~" quoted-insert
bindkey "^e[5C" forward-word
bindkey "^eOc" emacs-forward-word
bindkey "e[5D" backward-word
bindkey "eOd" emacs-backward-word
bindkey "ee[C" forward-word
bindkey "ee[D" backward-word
bindkey "^H" backward-delete-word

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
        '%F{5}%F{2}%b%F{3}|%F{1}%a%F{5}%f '
zstyle ':vcs_info:*' formats       \
        '%F{5}%F{2}%b%F{5}%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
     echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

PROMPT="%{$fg_bold[cyan]%}%n%{$reset_color%} %{$fg_bold[blue]%}%1~ %{$reset_color%}%{$fg_bold[cyan]%}$(vcs_info_wrapper)%{$fg_bold[cyan]%}$ %{$reset_color%}"
