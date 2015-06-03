VUNDLE=~/.vim/bundle/vundle
if [ ! -e $VUNDLE -a -x /usr/bin/git ]; then
  echo "Cloning Vundle..."
  git clone https://github.com/gmarik/vundle.git $VUNDLE
fi
OHMYZSH=~/.oh-my-zsh
if [ ! -e $OHMYZSH -a -x /usr/bin/git ]; then
  echo "Cloning Oh My Zsh..."
  git clone https://github.com/robbyrussell/oh-my-zsh.git $OHMYZSH
fi

export GPG_TTY=$(tty)

if [ -d ~/.nix-profile ]; then
  . ~/.nix-profile/etc/profile.d/nix.sh
fi
