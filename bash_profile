if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi

HISTCONTROL=ignoredups:ignorespace
HISTFILESIZE=2000
HISTSIZE=1000
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

shopt -s histappend

export EDITOR=vim
export GIT_EXTERNAL_DIFF=sdiff_git.sh

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias lah="ls -lah"
alias la="ls -la"
alias ll='ls -alF'
alias ls='ls --color=auto'
alias mtr="mtr --curses"
alias passwd='adpasswd'
alias sudo="echo Did you mean fuckin? 1>&2"
alias fuckin="/usr/bin/sudo"

if [ -z "$TMUX" ]; then
  if [ ! -z "$SSH_TTY" ]; then
    # We logged in via SSH
    # if ssh auth variable is missing
    if [ -z "$SSH_AUTH_SOCK" ]; then
        export SSH_AUTH_SOCK="$HOME/.ssh/.auth_socket"
    fi
    if [ -z "$GPG_AGENT_INFO" ]; then
        export GPG_AGENT_INFO="$HOME/.gnupg/.auth_socket"
    fi
    # if socket is available create the new auth session
    if [ ! -S "$SSH_AUTH_SOCK" ]; then
        `ssh-agent -a $SSH_AUTH_SOCK` > /dev/null 2>&1
        echo $SSH_AGENT_PID > $HOME/.ssh/.auth_pid
    fi
    if [ ! -S "$GPG_AGENT_INFO" ]; then
        `gpg-agent --daemon $GPG_AGENT_INFO` > /dev/null 2>&1
        echo $GPG_AGENT_INFO > $HOME/.gnupg/.auth_pid
    fi
    # if agent isn't defined, recreate it from pid file
    if [ -z $SSH_AGENT_PID ]; then
        export SSH_AGENT_PID=`cat $HOME/.ssh/.auth_pid`
    fi
    if [ -z $GPG_AGENT_INFO ]; then
        export GPG_AGENT_INFO=`cat $HOME/.gnupg/.auth_pid`
    fi
    # Add all default keys to ssh auth
    ssh-add 2>/dev/null
    # start tmux
    /usr/local/bin/tmux attach
  fi
fi
