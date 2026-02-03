# ╔═══════════════════════════════════════════════════════════════╗
# ║  Steph's ZSH Config                                           ║
# ║  A cozy, modern shell setup for macOS                         ║
# ╚═══════════════════════════════════════════════════════════════╝

# ─────────────────────────────────────────────────────────────────
# Homebrew (M1 Mac)
# ─────────────────────────────────────────────────────────────────
eval "$(/opt/homebrew/bin/brew shellenv)"

# ─────────────────────────────────────────────────────────────────
# Colors & Prompt
# ─────────────────────────────────────────────────────────────────
autoload -Uz colors && colors
autoload -Uz vcs_info

# Enable git info in prompt
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %F{183}(%b)%f'
setopt PROMPT_SUBST

# Pretty prompt with soft rose/lavender tones
# Shows: time · directory · git branch
PROMPT='%F{218}%T%f %F{183}%~%f${vcs_info_msg_0_} %F{218}❯%f '

# Right prompt shows exit code if non-zero
RPROMPT='%(?..%F{210}✘ %?%f)'

# ─────────────────────────────────────────────────────────────────
# History
# ─────────────────────────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt HIST_IGNORE_DUPS       # Don't store duplicates
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicate
setopt HIST_FIND_NO_DUPS      # Don't show dups when searching
setopt HIST_REDUCE_BLANKS     # Remove extra blanks
setopt SHARE_HISTORY          # Share history between sessions
setopt APPEND_HISTORY         # Append, don't overwrite

# ─────────────────────────────────────────────────────────────────
# Better Reverse Search (Ctrl+R)
# ─────────────────────────────────────────────────────────────────
bindkey -e                              # Emacs keybindings
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^[[A' history-search-backward  # Up arrow searches
bindkey '^[[B' history-search-forward   # Down arrow searches

# ─────────────────────────────────────────────────────────────────
# Completion
# ─────────────────────────────────────────────────────────────────
autoload -Uz compinit && compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # Case insensitive
zstyle ':completion:*' menu select                    # Menu selection
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # Colored completions

# ─────────────────────────────────────────────────────────────────
# Directory Colors
# ─────────────────────────────────────────────────────────────────
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# ─────────────────────────────────────────────────────────────────
# Aliases
# ─────────────────────────────────────────────────────────────────
# Files & Navigation
alias ls="ls -GFh"
alias ll="ls -la"
alias la="ls -A"
alias ..="cd .."
alias ...="cd ../.."

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gp="git pull --rebase"
alias gl="git log --oneline -20"
alias gd="git diff"

# Quick edits
alias v="vim"
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias reload="source ~/.zshrc"

# Safety nets
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

# ─────────────────────────────────────────────────────────────────
# Colored Man Pages (soft rose theme)
# ─────────────────────────────────────────────────────────────────
man() {
    LESS_TERMCAP_mb=$'\e[1;35m' \
    LESS_TERMCAP_md=$'\e[1;38;5;183m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[38;5;218m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[4;38;5;183m' \
    command man "$@"
}

# ─────────────────────────────────────────────────────────────────
# Useful Options
# ─────────────────────────────────────────────────────────────────
setopt AUTO_CD              # cd by typing directory name
setopt CORRECT              # Spell correction for commands
setopt NO_BEEP              # No annoying beeps
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shell

# ─────────────────────────────────────────────────────────────────
# Path additions (add your own as needed)
# ─────────────────────────────────────────────────────────────────
export PATH="/opt/homebrew/bin:$PATH"

# VS Code (uncomment if installed)
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
