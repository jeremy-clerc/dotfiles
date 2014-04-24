# Keep some basic and interesting stuff

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# And now Customize

export CDPATH=~:~/Projects

eval "`dircolors`"
alias ls='ls --color=auto'
alias ll='ls -lAF'
alias l='ll'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ps='ps fauxwww'
alias j='jobs'

export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTFILESIZE="10000"
export HISTSIZE="1000"
export HISTCONTROL="ignoredups"
export HISTIGNORE="j:jobs:cd:bg:fg*:ls:l:ll:exit:history*:top:ps:screen:tmux"

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

function git_repo() {
  git status -s > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    BRANCH=$(git branch | awk '{ if ($1 == "*") { print $2 } }')
    if [ $(git status -s | wc -l) -ne 0 ]
    then
      echo -e " \[\e[1;31m\]${BRANCH}"
    else
      echo -e " \[\e[1;37m\]${BRANCH}"
    fi
  fi
}

if [ $TERM = "screen" ]
then
  PROMPT_COMMAND='PS1="\[\e[1;35m\][\[\e[1;34m\]\h \$(if [[ \j != 0 ]]; then echo \"\[\e[1;33m\]\jz \"; fi)\[\e[1;32m\]\w`git_repo`\[\e[1;35m\]]\[\e[1;30m\] \$\[\e[0m\] "'
else
  PROMPT_COMMAND='PS1="\[\e[1;34m\]\h \$(if [[ \j != 0 ]]; then echo \"\[\e[1;33m\]\jz \"; fi)\[\e[1;32m\]\w`git_repo`\[\e[1;30m\] \$\[\e[0m\] "'
fi

