# Oh-my-zsh settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="mad"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# User settings
alias python="/usr/local/bin/python3"
alias pip="/usr/local/bin/pip3"
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)
export PATH=/usr/local/bin:/usr/local/sbin:$PATH