# base-files version 3.9-3

# To pick up the latest recommended .bash_profile content,
# look in /etc/defaults/etc/skel/.bash_profile

# Modifying /etc/skel/.bash_profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# ~/.bash_profile: executed by bash for login shells.

# source the system wide bashrc if it exists
if [ -e /etc/bash.bashrc ] ; then
  source /etc/bash.bashrc
fi

# source the users bashrc if it exists
if [ -e "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
# if [ -d "${HOME}/bin" ] ; then
#   PATH=${HOME}/bin:${PATH}
# fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH=${HOME}/man:${MANPATH}
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH=${HOME}/info:${INFOPATH}
# fi

#put homebrew path in front of bin
HOMEBREW=/usr/local/bin:/usr/local/sbin
export PATH=$HOMEBREW:$PATH

export SBT_OPTS=-XX:MaxPermSize=512m

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# opam
#. /Users/danluu/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
#eval `opam config env`

# julia
export JULIA=/Users/danluu/dev/julia
export PATH=$JULIA:$PATH

# go

export GOPATH=/Users/danluu/dev/go

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# added by Anaconda 1.8.0 installer
export PATH="/Users/danluu/anaconda/bin:$PATH"
