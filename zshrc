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

export HISTFILE=~/.histfile
export HISTSIZE=10000
export SAVEHIST=10000

export CDPATH=~:~/Projects

alias ls='ls --color=auto'
alias ll='ls -lAF'
alias l='ll'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ps='ps fauxwww'
alias j='jobs'

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

