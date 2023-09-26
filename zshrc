alias dotfiles="github ~/.dotfiles"
alias ls=exa
alias readlink=greadlink

export NVM_AUTO_USE=true
source ~/.zsh-nvm/zsh-nvm.plugin.zsh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

export PATH="${HOME}/.composer/vendor/bin:$PATH"

export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="${HOME}/.local/bin:$PATH"

source ~/.dotfiles/.zsh/composer.sh
source ~/.dotfiles/.zsh/git.sh

source ~/.dotfiles/jungehaie/zshrc
