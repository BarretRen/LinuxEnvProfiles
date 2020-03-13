#!/bin/zsh
##
## name     : tmuxen, tmux environment made easy
## author   : Xu Xiaodong <xxdlhy@gmail.com>
## license  : GPL
## created  : 2012 Jul 01
## modified : 2016 Nov 12
##

#cmd=$(which tmux) # tmux path
cmd='/home/barretr/tools/tmuxN/bin/tmux'
session=DoNotTalk   # session name

if [ -z $cmd ]; then
    echo "You need to install tmux."
    exit 1
fi

$cmd has -t $session 2> /dev/null

if [ $? -ne 0 ]; then
    stty sane
    $cmd new -s $session -d -n FDT
    $cmd neww -t $session -d -n CVP
    $cmd neww -t $session -d -n CVM
    $cmd selectw -t $session:1
fi

stty sane
$cmd att -t $session

exit 0
