VUNDLE=~/.vim/bundle/vundle
if [ ! -e $VUNDLE -a -x /usr/bin/git ]; then
  echo "Cloning Vundle..."
  git clone https://github.com/gmarik/vundle.git $VUNDLE
fi
