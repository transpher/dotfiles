# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=256
SAVEHIST=10000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/transpher/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall

zstyle ':completion:*' list-colors ''

source ~/dotfiles/incr*.zsh

setopt correct
setopt auto_pushd
setopt noautoremoveslash

LANG=ja_JP.UTF-8
PROMPT=$'%B%{\e[32m%}%n@%m %{\e[34m%}%#%{\e[00m%}%b '
RPROMPT=$'%B%{\e[33m%}[%~]%{\e[00m%}%b'

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
#alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -u $HOME/.vimrc "$@"'
