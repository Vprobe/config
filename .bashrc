# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ========================PROMT===========================
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# PS1="\[[\e[1;37m\]\[\e[1;32m\]\u\[\e[0;39m\]@jobs:\j]\n\w\\$ \[\e[0m\]"
PS1="\n\[\e[1;37m\][\[\e[1;32m\]\u\[\e[0;39m\]@\[\e[1;36m\]jobs:\j \[\e[1;33m\]\w\[\e[0;39m\]\[\e[1;35m\]\$(parse_git_branch)\[\e[0;39m\]\[\e[1;37m\]]\[\e[0;39m\]\n$ "
# ========================BASHMARKS FOR SHELL==========================
source ~/.local/bin/bashmarks.sh
# =========================MC==============================
# Скрипт, чтобы MC понимал цвета 256
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi
# ========================TMUX===========================
# Подключиться к раннее созданной сессии tmux
alias tmux='tmux attach || tmux new '
# ========================LINUX===========================
# Man-страницы на русском
export MANOPT="-L ru"
# Для работы с приводом
alias cdrom="mount -v /home/dvd_rom"
alias ucdrom="umount -v /dev/cdrom"
# Удаление и установка пакетов
alias agi="sudo apt-get install"
alias agr="sudo apt-get remove"
# Обновление пакетов
alias update='sudo apt-get update && sudo apt-get upgrade'
alias clean='sudo apt-get autoremove && sudo apt-get autoclean'
# LS
alias ll='ls -lSh'
alias la='ls -a'
alias l.='ls -1Xd .*'
alias lal='ls -alSh'
alias lsg='ls -alFh | grep '
alias l1='ls -1XS'
# CD ..
alias ..='cd ..'
alias bd='cd "$OLDPWD"'
# Пишет, что директория создана
alias mkdir='mkdir -pv'
# Размер
alias size='du -ha --max-depth=1'
# Анонс копирования/перемещения/trash
alias trash='trash -v'
alias cp='cp -vi'
alias mv='mv -vi'
# Поиск процесса
alias pg='ps ax | grep'
# Калькулятор
alias calc="bc -l"
# HISTORY
alias hi='history'
alias hig='history | grep'
# JOBS
alias j='jobs -l'
# POWEROFF
alias poweroff='sudo /sbin/poweroff'
# REBOOT
alias reboot='sudo /sbin/reboot'
# BASHRC
alias bashrc="vim ~/.bashrc"
# VIMRC
alias vimrc="sudo vim /etc/vim/vimrc"
# HELP COMMANDS
alias linh="less -N ~/Desktop/conf/txt/linuxcom.txt"
# ===========================ARCHIVES==========================
alias untar="tar -xvf"
alias untargz="tar -xvzf"
alias untarbz="tar -xvjf"
# ===========================SCREENFETCH==========================
alias sf="screenfetch"
# =========================YII2======================
# for test codeception yii2
alias cept="./vendor/bin/codecept"
# ===========================GIT==========================
alias ggll='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias ggss='git status '
alias ggbb='git branch '
# =========================APACHE=========================
alias astat='sudo /etc/init.d/apache2 status'
alias arel='sudo /etc/init.d/apache2 reload'
alias ares='sudo /etc/init.d/apache2 restart'
alias asta='sudo /etc/init.d/apache2 start'
alias asto='sudo /etc/init.d/apache2 stop'
# DROPBOX
alias dropb='dropbox stop && DBUS_SESSION_BUS_ADDRESS="" dropbox start'

