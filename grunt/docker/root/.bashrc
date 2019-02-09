#!/bin/bash

# Display git information in PS1
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# AWS Command Completion
if [ -f ~/Library/Python/3.7/bin/aws_completer ] ; then
  complete -C "$HOME/.local/bin/aws_completer" aws
fi

export PATH=$HOME/.local/bin:$PATH

# Source .bash_aliases
if [ -f "${HOME}"/.bash_aliases ]; then
  source "${HOME}"/.bash_aliases
fi
