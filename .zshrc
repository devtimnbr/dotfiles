# Source zsh plugins
source $(brew --prefix)/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Initialize Starship and Zoxide and thefuck
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(thefuck --alias)"

# Performance and Configuration Exports
setopt hist_ignore_all_dups                         # Ignore duplicate history entries
export ZSH_DISABLE_COMPFIX=true                     # Speed up zsh load by disabling compfix
export HISTFILE="$XDG_DATA_HOME/zsh/history"        # History file for better organization
export HISTSIZE=10000                               # Increase history size
export MANPAGER="$(which nvim) +Man!"               # Use Neovim as MANPAGER for better readability
export XDG_CONFIG_HOME="$HOME/.config"              # Set XDG_CONFIG_HOME for centralized config management
export XDG_CACHE_HOME="$HOME/.cache"                # Set XDG_CACHE_HOME for centralized cache management
export XDG_DATA_HOME="$HOME/.local/share"           # Set XDG_DATA_HOME for centralized data management

# Color Scheme
export BLACK=0xff181819
export WHITE=0xffe2e2e3
export RED=0xfffc5d7c
export GREEN=0xff9ed072
export BLUE=0xff76cce0
export YELLOW=0xffe7c664
export ORANGE=0xfff39660
export MAGENTA=0xffb39df3
export GREY=0xff7f8490
export TRANSPARENT=0x00000000
export BG0=0xff2c2e34
export BG1=0xff363944
export BG2=0xff414550

# Load Cargo environment if available
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# nnn file manager
export NNN_TMPFILE="$HOME/.config/nnn/.lastd"
export NNN_OPTS="AdHoU"
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
function nnn () {
  command nnn "$@"

  if [ -f "$NNN_TMPFILE" ]; then
          . "$NNN_TMPFILE"
  fi
}

# Configure SSH with Color Support
alias ssh="TERM=xterm-256color ssh"

# Aliases for common dirs
alias home="cd ~"
alias docs="cd ~/Documents"

# System Aliases
alias ..="cd .."
alias x="exit"

# Git Aliases
alias gaa='git add --all'
alias gcm='git commit -m'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gs='git status'
alias glog='git log --oneline --graph --decorate --all'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gf='git fetch'
alias gstash='git stash'
alias gsp='git stash pop'
alias gd='git diff'
alias grh='git reset --hard'
alias grb='git rebase'
alias grbi='git rebase -i'
alias gm='git merge'
alias gshow='git show --name-only'
alias gcp='git cherry-pick'

# Docker Aliases
alias dps='docker ps'
alias dstop='docker stop $(docker ps -q)'
alias drm='docker rm $(docker ps -a -q)'  # Removes all stopped containers
alias dimages='docker images'

# Yarn Commands
alias ya='yarn add'
alias yad='yarn add -D'
alias yb='yarn build'
alias yd='yarn dev'
alias yg='yarn go'
alias yga='yarn global add'
alias yr='yarn remove'
alias ys='yarn start'
alias yyb='yarn && yarn build'
alias yyd='yarn && yarn dev'
alias yui='yarn upgrade-interactive --latest'
alias ygui='yarn global upgrade-interactive --latest'
alias ylg='yarn global list'

# NPM Commands
alias nr='npm run'
alias nrs='npm run start'
alias ni='npm install'
alias nid='npm install -D'
alias nig='npm install -g'
alias no='npm outdated'
alias nog='npm outdated -g --depth=0'
alias nrb='npm run build'
alias nrd='npm run dev'
alias nrf='npm run format'
alias nu='npm uninstall'
alias nug='npm uninstall -g'
alias nlg='npm list -g --depth=0'


alias pr='pnpm run'
alias prs='pnpm run start'
alias pi='pnpm install'
alias pid='pnpm install -D'
alias pig='pnpm install -g'
alias po='pnpm outdated'
alias pog='pnpm outdated -g --depth=0'
alias prb='pnpm run build'
alias prd='pnpm run dev'
alias prf='pnpm run format'
alias pu='pnpm uninstall'
alias pug='pnpm uninstall -g'
alias plg='pnpm list -g --depth=0'
alias pc='pnpm create'


alias br='bun run'
alias brs='bun run start'
alias bi='bun install'
alias bid='bun install --dev'
alias bug='bun add --global'
alias bo='bun outdated'
alias bog='bun outdated --global'
alias brb='bun run build'
alias brd='bun run dev'
alias buf='bun run format'
alias bu='bun remove'
alias bugrm='bun remove --global'
