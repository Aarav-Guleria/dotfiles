#####  STARSHIP CONFIG

export STARSHIP_CONFIG="$HOME/.config/starship.toml"

#####  BASIC SHELL SETTINGS

DISABLE_AUTO_TITLE="true"

# History
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
HIST_STAMPS="yyyy-mm-dd"

setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
# setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY

#####  TERMINAL

# Only set outside tmux
[[ -z "$TMUX" ]] && export TERM="xterm-256color"

#####  OH-MY-ZSH
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting # must be last
)

# No OMZ theme (starship handles prompt)
ZSH_THEME=""

source "$ZSH/oh-my-zsh.sh"

#####  PROMPT

eval "$(starship init zsh)"

#####  EDITOR

if [[ -n $SSH_CONNECTION ]]; then
  export VISUAL=vim
  export EDITOR=vim
else
  export VISUAL=nvim
  export EDITOR=nvim
fi

#####  KEYBINDINGS & OPTIONS

bindkey -v
export KEYTIMEOUT=1
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
node() { unset -f node; nvm; node "$@"; }
npm()  { unset -f npm;  nvm; npm  "$@"; }
npx()  { unset -f npx;  nvm; npx  "$@"; }

#####  FZF

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

#####  ZOXIDE

eval "$(zoxide init zsh)"

#####  ALIASES

alias zshconfig="nvim ~/.zshrc"
alias omzconfig="nvim ~/.oh-my-zsh"
alias rm="rm -i"

alias ls='eza --icons --group-directories-first --git'
alias ll='eza -lah --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first --git'
alias tree='eza --tree'

#####  SECRETS (KEEP LAST)

[ -f ~/.config/secrets.env ] && source ~/.config/secrets.env
