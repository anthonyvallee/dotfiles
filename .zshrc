# -------------------------
# |   ZSH configuration   |
# -------------------------

export ZSH=/home/laptop/.oh-my-zsh

ZSH_THEME="robbyrussell"

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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='emacsclient -nw'
else
    export EDITOR='emacsclient -nc'
fi

# Keybindings
bindkey "[D" backward-word
bindkey "[C" forward-word

# Aliases & quick functions
# FIX: Can add user to 'docker' group
# alias docker="sudo docker"
# alias docker-compose="sudo docker-compose"
alias e="eval $EDITOR"
function ee {
    eval $EDITOR $@
    exit 0
}
alias i3config="e ~/.i3/config"
alias prog="cd ~/Documents/Programming"
alias :q="exit"
alias vi="vim"
alias work="cd ~/Documents/Work"
alias xup="xrdb ~/.Xresources"
alias zshconfig="e ~/.zshrc"
alias zshenv="e ~/.zshenv"
alias zshreload="source ~/.zshenv && source ~/.zshrc"

# Configure Node, NPM and yarn to run in Docker
export DOCKER_NODE_IMAGE="react:0.0.3"
export DOCKER_NPM_PATH="/.npm-global"
function _dockernode {
    docker run -it --rm -v $(pwd):/opt/app -v $NPM_PATH:$DOCKER_NPM_PATH -w /opt/app "$@"
}
function _node { _dockernode "$1" "node" "${@:2}" }
function _npm { _dockernode "$1" "npm" "${@:2}" }
function _yarn { _dockernode "$1" "yarn" "${@:2}" }
function _handleMissingArg {
    cat << EOF
error: missing Docker image

usage: $1 image [args]...
EOF
}
function nodef {
    if [ -z "$1" ]
    then
        _handleMissingArg "node"
        return 1
    fi
    _node "$@"
}
function npmf {
    if [ -z "$1" ]
    then
        _handleMissingArg "npm"
        return 1
    fi
    _npm "$@"
}
function yarnf {
    if [ -z "$1" ]
    then
        _handleMissingArg "yarn"
        return 1
    fi
    _yarn "$@"
}
function rchownme {
    local _PWD=$PWD
    sudo chown -R $(stat -c "%u:%g" $_PWD) $_PWD
}
