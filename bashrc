# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## PS1
PS1='[\w] $ '

### Env variables

export EDITOR="nvim"
export TERM="rxvt-256color"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

## History
export HISTSIZE=     ## Unlimited
export HISTFILESIZE=
export HISTCONTROL=ignoredups:erasedups

## man colors
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


## Aliases

## Make ls use color, human readable file size, sort
## by file extension and in column (-1X) and directories first
alias ls='ls --color=always -h -1X --group-directories-first'

## For sudo aliases
alias sudo='sudo '

## Trash
alias del='trash-put'
alias rm='echo "Dont use this"'

## For colors in less
alias less='less -R'
alias dmesg='dmesg --color=always'
alias pacman='pacman --color=always'

## Use neovim
alias vim='nvim'

alias mv='mv -n'
alias short='PS1="~$ "'
alias mkdir='mkdir -pv'
alias mupdf='mupdf -C 999999'           ## Make mupdf background darker
alias server="ssh server -t tmux a"     ## ssh right into tmux session
alias please='sudo $(history -p \!\!)'  ## run previous command as sudo
alias myip='curl http://ifconfig.me/ip'
alias spotify='firejail --noroot --private=~/Firefox/ spotify'
alias trc="transmission-remote-cli -f $HOME/.transmission-remote-cli"


## Shell options
shopt -s autocd
shopt -s checkwinsize
shopt -s cmdhist        ## Save multi line commands as one
shopt -s histappend     ## Append history dont overwrite

set -o noclobber
set -o vi
set echo-control-characters off ## Dont echo Ctrl-C


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


## Usage: reminder n min/hours message
reminder()
{
    echo "notify-send "$3"" | at now + $1 $2 &>/dev/null
    echo "Reminder: $3 set for $1 $2 from now."
}

## Usage: timer n
timer()
{
    sleep $1 && espeak "Times up"
}

## Word of the day
wod()
{
    w3m www.dictionary.com/wordoftheday | cat | grep -e "Word of the Day" -x -A99 | grep -e "new every day" -x -B 99 > /tmp/wod.txt

    echo ==========================================================
    cat /tmp/wod.txt
    echo ==========================================================

}
