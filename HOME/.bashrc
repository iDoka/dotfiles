# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000
# add command into .bash_history immediately, not with the end of the session
# useful with multiple sessions
PROMPT_COMMAND='history -a;history -n'
export HISTTIMEFORMAT='%F %T ' # log with datestamp
# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize
#export HISTIGNORE="&:ls:[bf]g:top:free:exit:make:ifc:mc:df:tt:zz"
#export HISTTIMEFORMAT='%h %d %H:%M:%S '

## Leave for a history
## I have no idea what are mean these options:
shopt -s cdspell
shopt -s cmdhist




# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


################ ALIASES ################
for file in ~/.aliases/*.alias
do
. ${file}
done
#########################################


export EDITOR=joe


## PowerLine
## https://github.com/powerline/powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh


## alacritty
## https://github.com/alacritty/alacritty/blob/master/INSTALL.md#linux--windows--bsd
source ~/.shell/alacritty.bash

## BAT colorizer
source ~/.autocompletion/bat.bash


