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

export KANBAN_FILE="kanban.json"
export MAVEN_OPTS="--sun-misc-unsafe-memory-access=allow"
export JAVA_HOME="/usr/lib/jvm/java-26-openjdk"
export BRAVE_PATH="/usr/bin/brave"

export PATH="$HOME/.scripts:$PATH"
export PATH="$XDG_CONFIG_HOME/composer/vendor/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin/:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"


eval "$(starship init zsh)"

# Plugin Sources
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath+=('/usr/share/zsh/site-functions')

# Enable Zsh's completion system
autoload -Uz compinit && compinit

TMUX_SESSION_NAME="Z"
# Start (or attach to) tmux automatically if not already inside tmux
if [[ -z "$TMUX" ]]; then
  # Try to attach to an existing session named 'Z', else create it
  tmux attach -t $TMUX_SESSION_NAME || tmux new -s $TMUX_SESSION_NAME
fi


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Vi mode
bindkey -v
export KEYTIMEOUT=1

export EDITOR='nvim'
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

export VI_MODE_SET_CURSOR=true

function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]]; then
        echo -ne '\e[2 q'
    else
        echo -ne '\e[6 q'
    fi
}
zle -N zle-keymap-select

function zle-line-init(){
    zle -K viins
    echo -ne '\e[6 q'
}
zle -N zle-line-init

function vi-yank-clipboard {
    zle vi-yank
    echo "$CUTBUFFER" | wl-copy
}
zle -N vi-yank-clipboard
bindkey -M vicmd 'y' vi-yank-clipboard

# pnpm
export PNPM_HOME="/home/zndionisio/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# opencode
export PATH=/home/zndionisio/.opencode/bin:$PATH

# jav
export PATH="/home/zndionisio/.local/bin:$PATH"
