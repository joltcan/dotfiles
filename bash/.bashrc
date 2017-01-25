# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# Source local as well
if [ -f ~/.bashrc.local ]; then
	. ~/.bashrc.local
fi
if [ -f ~/.bash_git ]; then
	. ~/.bash_git
fi
if [ -f ~/.uber_prompt.include ]; then
	. ~/.uber_prompt.include
fi

eval $(dircolors -b)
_rev="\[$(tput rev 2> /dev/null)\]"
_reset="\[$(tput sgr0 2> /dev/null)\]"
PS1="[${_rev}\u@\h${_reset}]\w\\$ "

# User specific aliases and functions
alias cal='cal -3 -m'
alias gpp='git pull && git push'
alias jävel=git
alias l='ls -lahF'
alias ll='l'
alias mkpasswd='tr -dc a-km-np-zA-HJ-NP-Z2-9 < /dev/urandom 2>/dev/null | head -c 16 ; echo'
alias rsv='rsync -avP'
alias rsdel='rsync --archive --one-file-system --verbose --stats --progress --delete'
alias rs='rsync --archive --one-file-system --verbose --stats --progress'
alias sping='ping ping.sunet.se'
alias time2date='python -c "import time,sys;  print time.localtime(float(sys.argv[1]))"'
alias upgrade='sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get clean'
alias vi=vim
alias admin='mosh -p 2224 admin -- tmux a -d' 


