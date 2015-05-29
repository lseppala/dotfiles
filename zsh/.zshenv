LOCAL_ZSHENV=~/.zshenv.$(hostname -s).local
if [ -e $LOCAL_ZSHENV ]; then
  source $LOCAL_ZSHENV
fi

export EDITOR=$(which vim)
