# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' ignore-parents parent pwd directory
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/jeremy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
alias ls='ls --color -AF'
alias ll='ls -l'
alias l='ls -al'
alias nt='netstat -ltupn'


autoload -U colors && colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
    eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

function bk() {
  if [ $# -eq 1 ]
  then
    if [ -f $1.1 ]
    then
      Z=$(find ./$1.[0-9]* | awk -F"." '{ print $NF }' | sort -h | tail -n1)
      for ((i=$Z;i>0;i-=1))
      do
        mv $1.$i $1.$((i+1))
      done
    fi
    mv $1 $1.1
  fi
}

source ${HOME}/liquidprompt/liquidprompt
LP_PS1_PREFIX=${LP_PS1_PREFIX}"(%T)"

DEBEMAIL="jeremy@clerc.io"
DEBFULLNAME="Jeremy Clerc"
export DEBEMAIL DEBFULLNAME

export GOROOT=$HOME/go
export GOPATH=$HOME/Projects/GO/gocode
export GOBIN=$GOPATH/bin
export PATH=$GOROOT/bin:$GOBIN:$PATH

