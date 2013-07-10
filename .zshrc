# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1024
SAVEHIST=10000
setopt auto_cd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/transpher/.zshrc'
zstyle ':completion:*' ignore-parents parent pwd ..

autoload -Uz compinit
compinit

# End of lines added by compinstall

zstyle ':completion:*' list-colors ''

source ~/dotfiles/incr*.zsh

setopt correct
setopt auto_pushd
setopt pushd_ignore_dups
setopt noautoremoveslash
setopt interactive_comments
setopt share_history
setopt hist_ignore_all_dups
setopt hist_save_nodups
setopt hist_ignore_space
setopt hist_reduce_blanks

disable r

LANG=ja_JP.UTF-8
PROMPT=$'%B%{\e[32m%}%n@%m %{\e[34m%}%#%{\e[00m%}%b '
RPROMPT=$'%B%{\e[33m%}[%~]%{\e[00m%}%b'
TERM=xterm-256color

case "${TERM}" in
	kterm*|xterm*)
		precmd() {
			echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
		}
		;;
esac

alias ls="ls -F --color=auto"
alias grep="grep --color=auto"
alias emacs="emacs -nw"
alias javac="javac -J-Dfile.encoding=utf-8"
alias java="java -Dfile.encoding=utf-8"
#alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -u $HOME/.vimrc "$@"'
