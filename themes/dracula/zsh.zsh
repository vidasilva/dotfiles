# ~/.config/themes/dracula/zsh.zsh

export HIGHLIGHT_STYLE="dracula"
export PYGMENTIZE_STYLE="dracula"
export BAT_THEME="Dracula"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Dracula palette
dracula_foreground="#f8f8f2"
dracula_comment="#6272a4"
dracula_cyan="#8be9fd"
dracula_green="#50fa7b"
dracula_orange="#ffb86c"
dracula_pink="#ff79c6"
dracula_purple="#bd93f9"
dracula_red="#ff5555"
dracula_yellow="#f1fa8c"

# Syntax colors
ZSH_HIGHLIGHT_STYLES[default]="fg=$dracula_foreground"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=$dracula_red,bold"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=$dracula_purple"
ZSH_HIGHLIGHT_STYLES[alias]="fg=$dracula_pink"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=$dracula_pink"
ZSH_HIGHLIGHT_STYLES[function]="fg=$dracula_pink"
ZSH_HIGHLIGHT_STYLES[command]="fg=$dracula_cyan"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=$dracula_cyan,underline"
ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=$dracula_comment"
ZSH_HIGHLIGHT_STYLES[hashed-command]="fg=$dracula_cyan"

# Strings & variables
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=$dracula_yellow"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=$dracula_yellow"
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=$dracula_green"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=$dracula_orange"
ZSH_HIGHLIGHT_STYLES[command-substitution]="fg=$dracula_orange"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]="fg=$dracula_comment"
ZSH_HIGHLIGHT_STYLES[process-substitution]="fg=$dracula_orange"

# Options & paths
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=$dracula_green"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=$dracula_green"
ZSH_HIGHLIGHT_STYLES[path]="fg=$dracula_purple,underline"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=$dracula_orange"
ZSH_HIGHLIGHT_STYLES[history-expansion]="fg=$dracula_orange"

# Brackets and quotes
ZSH_HIGHLIGHT_STYLES[bracket-level-1]="fg=$dracula_pink"
ZSH_HIGHLIGHT_STYLES[bracket-level-2]="fg=$dracula_cyan"
ZSH_HIGHLIGHT_STYLES[bracket-level-3]="fg=$dracula_green"
