# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
# if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#   source /usr/share/zsh/manjaro-zsh-prompt
# fi

#Source Aliases
if [ -f ~/.scripts/.aliases ]; then
    source ~/.scripts/.aliases 
fi

export PATH="$HOME/.scripts:$PATH"
export MAVEN_OPTS="--sun-misc-unsafe-memory-access=allow"
export PATH="$XDG_CONFIG_HOME/composer/vendor/bin:$PATH"



eval "$(starship init zsh)"

# Plugin Sources
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath+=('/usr/share/zsh/site-functions')

# Enable Zsh's completion system
autoload -Uz compinit && compinit

# Start (or attach to) tmux automatically if not already inside tmux
if [[ -z "$TMUX" ]]; then
  # Try to attach to an existing session named 'default', else create it
  tmux attach -t main || tmux new -s main
fi


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
