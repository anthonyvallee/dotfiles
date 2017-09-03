# -------------------------
# |   ZSH configuration   |
# -------------------------

export ZSH=/home/laptop/.oh-my-zsh

ZSH_THEME="agnoster"

DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="false"

COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_CA.UTF-8

# export SSH_KEY_PATH="~/.ssh/rsa_id"

# -------------------------
# |  User configuration   |
# -------------------------

# Preferred editor (local & remote)
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='emacsclient -nw'
else
    export EDITOR='emacsclient -nc'
fi

# Aliases & quick functions
# FIX: Can add user to 'docker' group
# alias docker="sudo docker"
# alias docker-compose="sudo docker-compose"
alias e="eval $EDITOR"
function ee {
    eval $EDITOR $@
    exit 0
}
alias prog="cd ~/Documents/Programming"
alias :q="exit"
alias school="cd ~/Documents/School"
alias vi="vim"
alias work="cd ~/Documents/Work"
alias zshconfig="e ~/.zshrc"
alias zshenv="e ~/.zshenv"
alias zshreload="source ~/.zshenv && source ~/.zshrc"
