# ~/.bashrc - Minimal, Fast Bash Configuration for On-Prem Linux Nodes

# 1. Essential Exports
export EDITOR="nvim"
export VISUAL="nvim"
alias v="nvim"

# Minimal Prompt: user@host working_directory $ 
# Green for user@host, Blue for path, bold text
PS1='\[\e[1;32m\]\u@\h\[\e[0m\] \[\e[1;34m\]\w\[\e[0m\] \$ '

# Enable vi editing mode in bash
set -o vi

# 2. PATH Management
# Add local user bin directories to PATH if they aren't already
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    export PATH="$HOME/bin:$PATH"
fi
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# 3. pyenv (if installed)
if command -v pyenv >/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# 4. Source specific local env files (if they exist)
if [[ -f "$HOME/bastion.sh" ]]; then
    source "$HOME/bastion.sh"
fi

if [[ -f "$HOME/.local/bin/env" ]]; then
    source "$HOME/.local/bin/env"
fi

# 5. Aliases
alias ls="ls --color=auto"
alias ll="ls -la --color=auto"
alias gc='git commit'
export CLICOLOR=1

alias emacsb='pipe-to-emacs-buffer.sh'
alias pi-sandbox='~/bin/run-pi.sh'
