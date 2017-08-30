# Docker/Node configuration
export NPM_PATH=$HOME/.npm-global
export NPM_BIN=$NPM_PATH/bin

# Vagrant configuration
export VAGRANT_DEFAULT_PROVIDER=lxc
export VAGRANT_HOME=/data/.vagrant.d
export VAGRANT_LOG=DEBUG

# Update PATH
export PATH=$NPM_BIN:$HOME/bin:/usr/local/bin:$PATH
export MANPATH=/usr/local/man:$MANPATH
