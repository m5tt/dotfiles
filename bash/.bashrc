# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## PS1
PS1='[\w] $ '

### Env variables

# ruby
PATH=$PATH:~/.gem/ruby/2.4.0/bin
PATH=$PATH:~/.gem/ruby/2.5.0/bin
PATH=$PATH:~/.local/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


export PATH

export EDITOR="nvim"
export TERM="rxvt-256color"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

## History
export HISTSIZE=     ## Unlimited
export HISTFILESIZE=
export HISTCONTROL=ignoredups:erasedups

## Man colors
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

## Aliases

## Make ls use color, human readable file size, sort
## by file extension, print files in column (-1X) and sort directories first
## counting symlinks to directories as directores (-L)
alias ls='ls --color=always -h -1X -L --group-directories-first'

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

alias poweroff='poweroff-check 0'
alias reboot='poweroff-check 1'
alias mv='mv -i'                        ## Prompt before overwrite
alias short='PS1="~$ "'                 ## When file path is super long
alias mkdir='mkdir -pv'                 ## Make parent dir if needed and verbose
alias mupdf='mupdf -C 999999'           ## Make mupdf background darker
alias server="ssh server -t tmux a"     ## ssh right into tmux session
alias please='sudo $(history -p \!\!)'  ## run previous command as sudo
alias myip='curl http://ifconfig.me/ip'
alias spotify='firejail --noroot --private=~/Firefox/ spotify'
alias trc="transmission-remote-cli -f $HOME/.transmission-remote-cli"
alias py='python'

alias update='yes | sudo pacman -Syyuu && pacaur -u'

## Shell options
shopt -s autocd
shopt -s checkwinsize
shopt -s cmdhist        ## Save multi line commands as one
shopt -s histappend     ## Append history dont overwrite
shopt -s extglob        ## extended globbing features

set -o noclobber
set -o vi                       ## vi mode in shell instead of emacs
set echo-control-characters off ## Dont echo Ctrl-C


## Search repos when command not found
#source /usr/share/doc/pkgfile/command-not-found.bash

## Autojump
source /etc/profile.d/autojump.bash


## Functions

## systemctl shortcuts
function start()    { sudo systemctl start $@; }
function stop()     { sudo systemctl stop $@; }
function restart()  { sudo systemctl restart $@; }
function status()   { systemctl status $@; }
function enable()   { sudo systemctl enable $@; }
function disable()  { sudo systemctl disable $@; }

## Usage: reminder n min/hours message
reminder()
{
    echo "notify-send 'Reminder' "$3"" | at now + $1 $2 &>/dev/null
    echo "Reminder: $3 set for $1 $2 from now."
}

## Usage: timer n
timer()
{
    sleep $1 && notify-send "Timer" "Times up"
}

## Word of the day
## TODO do this without w3m
wod()
{
    w3m www.dictionary.com/wordoftheday | cat | grep -e "Word of the Day" -x -A99 | grep -e "new every day" -x -B 99 > /tmp/wod.txt

    echo ==========================================================
    cat /tmp/wod.txt
    echo ==========================================================

}




export ANDROID_SDK_ROOT=~/Documents/Code/Android
export ANDROID_AVD_HOME=~/.android/avd

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
