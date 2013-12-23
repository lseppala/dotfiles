LOCAL_ZSHENV=~/.zshenv.$(hostname -s).local
if [ -e $LOCAL_ZSHENV ]; then
  source $LOCAL_ZSHENV
fi

export PATH=~/bin:$PATH
export EDITOR=$(which vim)
