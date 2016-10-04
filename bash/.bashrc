# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias rsdel='rsync --archive --one-file-system --verbose --stats --progress --delete'
alias rs='rsync --archive --one-file-system --verbose --stats --progress'
alias mkpasswd='tr -dc a-km-np-zA-HJ-NP-Z2-9 < /dev/urandom 2>/dev/null | head -c 16 ; echo'
alias cal='cal -3 -m'
alias vi=vim

_rev="\[$(tput rev 2> /dev/null)\]"
_reset="\[$(tput sgr0 2> /dev/null)\]"
PS1="[${_rev}\u@\h${_reset}]\w\\$ "

eval $(dircolors -b)
if [ -f ~/dotfiles/git/.bash_git ]; then
	. ~/dotfiles/git/.bash_git
fi
if [ -f ~/dotfiles/bash/uber_prompt.include ]; then
	. ~/dotfiles/bash/uber_prompt.include
fi

alias l='ls -lahF'
alias time2date='python -c "import time,sys;  print time.localtime(float(sys.argv[1]))"'
alias sping='ping ping.sunet.se'
alias rsv='rsync -avP'
alias gpp='git pull && git push'

alias jävel=git
alias ms='ssh segum-mgmt-01 -t ssh '
alias mgmt='ssh mgmt'
alias sysmgmt='ssh sys-mgmt'

export GOPATH=$HOME/src/go
