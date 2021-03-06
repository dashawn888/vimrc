# Ignore duplicates and whitespace in the history file.
HISTCONTROL=ignoredups:ignorespace

# Append to the history file, don't overwrite it.
shopt -s histappend

# History file size.
HISTSIZE=10000

# Some more ls aliases.
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias less='less -R'

# Enable programmable completion features.
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Set 256 color mode.
export TERM=screen-256color

# Add my home bin.
export PATH=${PATH}:~/bin

# Start powerline
source /home/shawnl/.vim/plugged/powerline/powerline/bindings/bash/powerline.sh
