# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
 #time that oh-my-zsh is loaded.
ZSH_THEME="terminalparty"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode autojump)

LOCAL_ZSHRC=~/.zshrc.$(hostname -s).local
if [ -e $LOCAL_ZSHRC ]; then
  source $LOCAL_ZSHRC
fi

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
bindkey "^r" history-incremental-search-backward
unsetopt correct_all
setopt extendedglob

gssh() {
    user=$(echo $1 | cut -f 1 -d '@')
    host=$(echo $1 | cut -f 2 -d '@')
    /usr/local/bin/ssh -v -R /home/$user/.gnupg/S.gpg-agent:$HOME/.gnupg/S.gpg-agent $user@$host
}


export NIX_CFLAGS_LINK="-L/usr/lib"
export NIX_CFLAGS_COMPILE="-idirafter /usr/include"

ghci-with() {
    nix-shell -p "haskellPackages.ghcWithPackages (pkgs: with pkgs; [$*])" \
        --command 'ghci'
}
export PKG_CONFIG_PATH="$HOME/.nix-profile/lib/pkgconfig"


hgrep() {
    search=$(for term in $@; do printf "| grep -- '$term' "; done)
    eval "history $search"
}

export SAVEHIST=1000000

alias utc="date -u +'%Y-%m-%dT%H:%M:%SZ'"

if `/usr/bin/which -s rbenv`; then
    eval "$(rbenv init -)"
fi

export PATH="$HOME/.yarn/bin:$PATH"
