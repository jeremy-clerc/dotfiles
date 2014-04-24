export CDPATH=~:~/Projects

export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -lAF'
alias l='ls $LS_OPTIONS -lAF'
alias ps='ps fauxwww'
alias j='jobs'

export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTFILESIZE="10000"
export HISTSIZE="1000"
export HISTCONTROL="ignoredups"
export HISTIGNORE="j:jobs:[bf]g:ll:exit:history*:top:ps:screen:tmux"

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

