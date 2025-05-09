alias dotfiles="github ~/.dotfiles"
alias ls=eza
alias readlink=greadlink
alias takeout="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock --add-host=host.docker.internal:host-gateway -it tighten/takeout:latest"

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

export DOCKER_HOST=$(docker context inspect | jq -r '.[0].Endpoints.docker.Host')

source ~/.dotfiles/.zsh/composer.sh
source ~/.dotfiles/.zsh/docker.sh
source ~/.dotfiles/.zsh/git.sh

source ~/.dotfiles/personal/zshrc
source ~/.dotfiles/jungehaie/zshrc
