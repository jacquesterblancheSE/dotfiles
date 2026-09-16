export EDITOR="nvim"
export VISUAL="nvim"
alias v="nvim"
# enable vim mode
bindkey -v
export KEYTIMEOUT=1

# Minimal prompt instead of powerlevel10k
PROMPT='%F{green}%n@%m%f %F{blue}%1~%f %# '

if command -v pyenv &> /dev/null; then
    eval "$(pyenv init --path)"
fi

if [[ -f "$HOME/bastion.sh" ]]; then
    source "$HOME/bastion.sh"
fi

if [[ -f "$HOME/.local/bin/env" ]]; then
    . "$HOME/.local/bin/env"
fi

alias ls="ls --color=auto"
alias gc='git commit'
export CLICOLOR=1

# For zsh-autosuggestions
source ~/.zsh_extensions/zsh-autosuggestions/zsh-autosuggestions.zsh

# For zsh-syntax-highlighting (should generally be sourced last or near the end)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
zstyle ':completion:*' list-colors "fg=8" "ma=fg=white,bg=32"
zstyle ':completion:*' menu select
source ~/.zsh_extensions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. "$HOME/.local/bin/env"

export PATH="$HOME/bin:$PATH"
alias emacsb='pipe-to-emacs-buffer.sh'
alias pi-sandbox='~/bin/run-pi.sh'
