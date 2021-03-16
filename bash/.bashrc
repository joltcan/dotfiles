# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi
# Source local as well
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
# Source ssh aliases if we have it
if [ -f ~/.bash_ssh ]; then
    source ~/.bash_ssh
fi
if [ -f ~/.bash_git ]; then
    source ~/.bash_git
fi
if [ -f ~/.uber_prompt.include ]; then
    source ~/.uber_prompt.include
fi
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
    # turn of completion for basename stuff
    shopt -u progcomp
fi

if [[ $OSTYPE == *darwin* ]]; then
    # good bye apple warning zsh warning
    export BASH_SILENCE_DEPRECATION_WARNING=1
    # dont update homebrew all the time
    export HOMEBREW_NO_AUTO_UPDATE=1
fi
# ssh for bash-completion
function _own_ssh_known_hosts() {
    perl -ne 'print "$1 " if /^([\w\d-\.]+).*$/i' ~/.ssh/known_hosts
}
function _own_ssh_completion() {
    perl -ne 'print "$1 " if /^host (.+)$/i' ~/.ssh/config
}

complete -o nospace -F _ssh root

# User specific aliases and functions
alias cal='cal -3 -m'
alias gpp='git pull && git push'
alias jävel=git
alias l='ls -lahF'
alias ll='l'
alias mkpasswd='tr -dc a-km-np-zA-HJ-NP-Z2-9 < /dev/urandom 2>/dev/null | head -c 16 ; echo'
alias root='ssh -l root -o ConnectionAttempts=100'
alias rsv='rsync -avP'
alias rp='rsync -aP'
alias rsdel='rsync --archive --one-file-system --verbose --stats --progress --delete'
alias rs='rsync --archive --one-file-system --verbose --stats --progress'
alias sping='ping ping.sunet.se'
alias time2date='python -c "import time,sys;  print (time.localtime(float(sys.argv[1])))"'
alias upgrade='sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get clean'
alias vi=vim
alias ap='ansible-playbook'

