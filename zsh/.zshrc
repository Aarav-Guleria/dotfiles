# options: p10k or starship

# PROMPT_ENGINE="p10k"
PROMPT_ENGINE="starship"

#####  powerlevel10k instant prompt
#####  (MUST BE AT THE TOP)

if [[ "$PROMPT_ENGINE" == "p10k" ]]; then
  typeset -g POWERLEVEL9K_MODE=vi
fi

#####  STARSHIP CONFIG (ONLY IF USED)

if [[ "$PROMPT_ENGINE" == "starship" ]]; then
  export STARSHIP_CONFIG="$HOME/.config/starship.toml"
else
  unset STARSHIP_CONFIG
fi

#####  BASIC SHELL SETTINGS

DISABLE_AUTO_TITLE="true"

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.histfile
HIST_STAMPS="yyyy-mm-dd"

export TERM="xterm-256color"

#####  OH-MY-ZSH

export ZSH="$HOME/.oh-my-zsh"

# Theme is handled manually (p10k section below)
# ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Dynamic theme selection
if [[ "$PROMPT_ENGINE" == "p10k" ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
else
  ZSH_THEME=""
fi

source "$ZSH/oh-my-zsh.sh"

#####  PROMPT ENGINE LOAD

if [[ "$PROMPT_ENGINE" == "p10k" ]]; then
  [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
elif [[ "$PROMPT_ENGINE" == "starship" ]]; then
  eval "$(starship init zsh)"
fi

#####  EDITOR

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR=vim
else
  export EDITOR=nvim
fi

#####  KEYBINDINGS & OPTIONS

bindkey -v
bindkey '^R' history-incremental-search-backward
unsetopt correct

#####  PATHS

export PATH="$HOME/.local/bin:$HOME/bin:$HOME/.npm-global/bin:$PATH"

#####  NVM (LAZY LOADING)

export NVM_DIR="$HOME/.nvm"

nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  nvm "$@"
}

#####  FZF

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

#####  ZOXIDE

eval "$(zoxide init zsh)"

#####  ALIASES

alias zshconfig="nvim ~/.zshrc"
alias omzconfig="nvim ~/.oh-my-zsh"

alias rm="rm -i"

# eza
alias ls='eza --icons --group-directories-first --git'
alias ll='eza -lah --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first --git'
alias tree='eza --tree'

#####  SECRETS (like passwords or api) (KEEP LAST)

[ -f ~/.config/secrets.env ] && source ~/.config/secrets.env
