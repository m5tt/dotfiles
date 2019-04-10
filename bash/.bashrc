# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## PS1
PS1='[\w] $ '

### Env variables
export PATH

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export EDITOR="vim"
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

alias mv='mv -i'                        ## Prompt before overwrite
alias short='PS1="~$ "'                 ## When file path is super long
alias mkdir='mkdir -pv'                 ## Make parent dir if needed and verbose
alias please='sudo $(history -p \!\!)'  ## run previous command as sudo
alias myip='curl http://ifconfig.me/ip'
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

## Functions

## systemctl shortcuts
function start()    { sudo systemctl start $@; }
function stop()     { sudo systemctl stop $@; }
function restart()  { sudo systemctl restart $@; }
function status()   { systemctl status $@; }
function enable()   { sudo systemctl enable $@; }
function disable()  { sudo systemctl disable $@; }

