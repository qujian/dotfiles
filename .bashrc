#
# ~/.bashrc
#

alias ls='ls --color=auto'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
