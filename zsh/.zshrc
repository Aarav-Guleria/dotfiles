##### STARSHIP CONFIG

export STARSHIP_CONFIG="$HOME/.config/starship.toml"

##### BASIC SHELL SETTINGS

DISABLE_AUTO_TITLE="true"

# History
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
HIST_STAMPS="yyyy-mm-dd"

setopt SHARE_HISTORY EXTENDED_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS HIST_VERIFY

##### TERMINAL

[[ -z "$TMUX" ]] && export TERM="xterm-256color"

##### OH-MY-ZSH

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting # must be last
)

source "$ZSH/oh-my-zsh.sh"

##### SYNTAX HIGHLIGHTING

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]='none'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,no-underline'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,no-underline'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow,no-underline'
ZSH_HIGHLIGHT_STYLES[path]='fg=white,no-underline'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,no-underline'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow,no-underline'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,no-underline'

##### PROMPT

eval "$(starship init zsh)"

##### EDITOR

if [[ -n $SSH_CONNECTION ]]; then
  export VISUAL=vim
  export EDITOR=vim
else
  export VISUAL=nvim
  export EDITOR=nvim
fi

##### KEYBINDINGS & OPTIONS

bindkey -v
export KEYTIMEOUT=1
bindkey '^R' history-incremental-search-backward
unsetopt correct

##### PATHS

export PATH="$HOME/.local/bin:$HOME/bin:$HOME/.npm-global/bin:$PATH"

##### NVM (LAZY LOADING)

export NVM_DIR="$HOME/.nvm"

nvm()  { unset -f nvm;  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"; nvm  "$@"; }
node() { unset -f node; nvm; node "$@"; }
npm()  { unset -f npm;  nvm; npm  "$@"; }
npx()  { unset -f npx;  nvm; npx  "$@"; }

##### FZF

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ]   && source /usr/share/fzf/completion.zsh

##### ZOXIDE

eval "$(zoxide init zsh)"

##### ALIASES

alias zshconfig="nvim ~/.zshrc"
alias omzconfig="nvim ~/.oh-my-zsh"
alias rm="rm -I --preserve-root"

alias ls='eza --icons --group-directories-first --git'
alias ll='eza -lah --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first --git'
alias tree='eza --tree'
alias trees="eza -Ta --icons --ignore-glob '.git'"

##### SECRETS (KEEP LAST)

[ -f ~/.config/secrets.env ] && source ~/.config/secrets.env
