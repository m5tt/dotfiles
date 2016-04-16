# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## PS1
PS1='[\w] $ '

### Env variables
export EDITOR="vim"
export HISTCONTROL=ignoredups
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib


## Aliases

## Make ls use color, human readable file size, sort 
## by file extension and in column (-1X) and directories first
alias ls='ls --color=always -h -1X --group-directories-first'

## Trash
alias del='trash-put'
alias rm='echo "Dont use this"'

## For colors in less
alias less='less -R'
alias dmesg='dmesg --color=always'
alias pacman='pacman --color=always'

alias short='PS1="~$ "'
alias mupdf='mupdf -C 999999' ## Make mupdf background darker
alias server="ssh server -t tmux a" ## ssh right into tmux session
alias trc="transmission-remote-cli -f $HOME/.transmission-remote-cli"
alias mv='mv -n'
alias myip='curl http://ifconfig.me/ip'
alias please='sudo $(history -p \!\!)' ## run previous command as sudo
alias spotify='firejail --noroot --private=~/Firefox/ spotify'
alias mkdir='mkdir -pv'


## man colors
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


## Shell options
shopt -s autocd
shopt -s checkwinsize
shopt -s cmdhist    ## Save multi line commands as one
shopt -s histappend ## Append history dont overwrite
set -o noclobber
set echo-control-characters off ## Dont echo Ctrl-C


## Binds
bind '"\e[B":history-search-forward'    ## History completion
bind '"\e[A":history-search-backward'
bind '\\C-f:unix-filename-rubout'       ## Delete backwards to slash


## Search repos when command not found
source /usr/share/doc/pkgfile/command-not-found.bash


## Functions

## systemctl shortcuts
function start()    { sudo systemctl start $@;   }
function stop()     { sudo systemctl stop $@;    }
function restart()  { sudo systemctl restart $@; }
function status()   { sudo systemctl status $@;  }
function enable()   { sudo systemctl enable $@;  }
function disable()  { sudo systemctl disable $@; }


## reminder()
## Usage: reminder n mins/hours message
reminder() {
    echo "notify-send "$3"" | at now + $1 $2 &>/dev/null
    echo "Reminder: $3 set for $1 $2 from now."
}
