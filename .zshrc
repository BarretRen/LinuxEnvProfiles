#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#
#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

#自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE

autoload -U compinit
compinit
# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

#Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always

# GNU Colors 需要/etc/DIR_COLORS文件 否则自动补全时候选菜单中的选项不能彩色显示
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'

 #Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

autoload -U colors
colors
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval _$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval $color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
FINISH="%{$terminfo[sgr0]%}"
PROMPT=$(echo "$CYAN%n@$YELLOW%M:$_BLUE%/$RED>
>$FINISH ")

export TERM="screen-256color"
# export LANG="zh_CN.UTF-8"
# export LC_ALL="zh_CN.UTF-8"
# PATH set
export PATH=/home/barretr/tools/tmuxN/bin:/home/barretr/tools/Gtags/bin:/home/barretr/tools/cmake/bin:/home/barretr/tools:$PATH

#alias
#vim
alias v='/home/barretr/tools/vim8/bin/vim'
alias vi='/home/barretr/tools/vim8/bin/vim'
alias vim='/home/barretr/tools/vim8/bin/vim'
alias vdf='/home/barretr/tools/vim8/bin/vimdiff'
alias cp='cp -r'
alias cl='clear'
alias rm='rm -r'
alias del='mv -t ~/.local/share/Trash/files --backup=t'
# alias tmux ='/home/barretr/tools/tmuxN/bin/tmux'
#workspace
alias fdt='cd /repo/barretr/fdt1265/sw'
alias dft='cd /repo/barretr/fdt1265_default/sw'
alias cvp='cd /repo/barretr/cvpsw'
alias cvm='cd /repo/barretr/cvmsw'
alias tmp='cd /repo/barretr/fdt1265_tmp/sw'

#ssh
alias labserver='ssh isamv@135.242.61.200'

#hg
alias hpu='hg pull -b .'

#lab
alias tmar='telnet 10.254.0.4'
alias tfox='telnet 10.254.0.19'
alias tnobel='telnet 10.254.0.27'
alias trab='telnet 10.254.0.31'
alias omar='octopus STDIO 10.254.0.4:UDP:23'
alias ofox='octolab 10.254.0.19'
alias ooct='octopus STDIO 10.254.0.11:UDP:23'
alias orab='octopus STDIO 10.254.0.31:UDP:23'
alias o13='octopus STDIO 135.251.92.58:UDP:23'

#tmux
alias tm='/home/barretr/tools/tm'
alias sc='screen -dRU codeFun'
