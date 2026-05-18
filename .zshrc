### ──────────────────────────────────────────────
### History settings
### ──────────────────────────────────────────────
setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh_history

### ──────────────────────────────────────────────
### Prompt (Starship)
### ──────────────────────────────────────────────
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export STARSHIP_CACHE="$HOME/.cache/"
eval "$(starship init zsh)"

### ──────────────────────────────────────────────
### Environment Exports
### ──────────────────────────────────────────────
export EDITOR=nvim
export VISUAL=nvim
export TERM=xterm-256color
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\\[[0-9;]*m//g; s/.\\x08//g\" | bat -l man -p'"

export ANDROID_SDK_ROOT="$HOME/.local/share/android-sdk"
export ANDROID_HOME="$ANDROID_SDK_ROOT"
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH"

### ──────────────────────────────────────────────
### Plugins
### ──────────────────────────────────────────────
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$HOME/.config/themes/current/zsh.zsh"

### ──────────────────────────────────────────────
### Keybindings
### ──────────────────────────────────────────────
# Use emacs keybindings even if EDITOR is vi
# Enable Vi mode
bindkey -v

# Edit the current command in your actual $EDITOR (vim/Nvim)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# Add back traditional backspace behavior (standard vi-mode is restrictive)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# Enable Ctrl+R for incremental search even in vi-mode
bindkey '^r' history-incremental-search-backward
# Fix for Delete key sending '~'
bindkey "\e[3~" delete-char

# Bind Home and End keys
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

# Fallback if terminfo fails
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

### ──────────────────────────────────────────────
### Aliases
### ──────────────────────────────────────────────
alias vim='nvim'
alias zshconf='vim ~/.zshrc'
alias src='source ~/.zshrc'
alias hyprconf='vim ~/.config/hypr/.'
alias yaziconf='vim ~/.config/yazi/.'
alias starconf='vim ~/.config/starship/starship.toml'
alias woficonf='vim ~/.config/wofi/.'
alias waybarconf='vim ~/.config/waybar/.'
alias kittyconf='vim ~/.config/kitty/kitty.conf'
alias vimconf='vim ~/.config/nvim/.'
alias code='vim ~/Projects/.'
alias coders='vim ~/Projects/Rust/.'
alias codec='vim ~/Projects/C/.'
alias codel='vim ~/Projects/Lua/.'
alias codepy='vim ~/Projects/Python/.'
alias wallpapers='cd ~/Pictures/Wallpapers/ && ll'
alias config='cd ~/.config && ll'
alias sddmtheme='sudoedit /usr/share/sddm/themes/sombra/Main.qml'
alias sddmconf='sudoedit /etc/sddm.conf'
alias dunstconf='nvim ~/.config/dunst/dunstrc'
alias cavaconf='cd ~/.config/cava/ && ll'
alias spotify='spotify_player'
alias spotifyconf='cd ~/.config/spotify-player/ && ll'
alias foxconf='cd ~/.mozilla/firefox/wg0iw7ty.default-release/chrome/ && ll'
alias c='clear'
alias cl='clear && ll'
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -lah'
alias ..='cd .. && ll'
alias python='python3'
alias picker='hyprpicker'
alias cman='man -s 3'
alias disk="df -h | grep -E '^(Filesystem|/dev/sda2)'"
alias ff='fastfetch'

### ──────────────────────────────────────────────
### Functions
### ──────────────────────────────────────────────
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

man() {
    env \
        PAGER=less \
        LESS='-R' \
        LESS_TERMCAP_mb=$'\e[1;35m' \
        LESS_TERMCAP_md=$'\e[1;35m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[48;5;236;38;5;189m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[4;38;5;183m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_mr=$'\e[7m' \
        LESS_TERMCAP_mh=$'\e[2m' \
        /usr/bin/man "$@"
}
# Refresh Starship prompt on mode change
#function zle-keymap-select() {
#  zle reset-prompt
#}
#zle -N zle-keymap-select

### ──────────────────────────────────────────────
### Completion system
### ──────────────────────────────────────────────
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' \
    'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors \
    '=(#b) #([0-9]#)*=0=01;31'
        zstyle ':completion:*:kill:*' command \
            'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
