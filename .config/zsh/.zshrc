PS1="[%B%F{magenta}%n%f%b@%B%F{cyan}%m%f%b %~] "

HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=999999
SAVEHIST=$HISTSIZE

setopt autocd
unsetopt beep

export KEYTIMEOUT=10
bindkey -v

## Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
     echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
     [[ ${KEYMAP} == viins ]] ||
     [[ ${KEYMAP} = '' ]] ||
     [[ $1 = 'beam' ]]; then
     echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

## Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

## hit j and k together to enter normal mode
# bindkey -M viins 'jk' vi-cmd-mode
# bindkey -M viins 'kj' vi-cmd-mode

bindkey '^w' backward-kill-word
bindkey '^h' backward-delete-char
bindkey '^r' history-incremental-search-backward

## Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

## Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

path+=('/home/rsh/work/scr')
path+=('/home/rsh/.local/bin')
path+=('/home/rsh/.radicle/bin')
path+=('/home/rsh/.local/share/gem/ruby/3.0.0/bin')
path+=('/home/rsh/.local/share/go/bin')

## aliases
alias tl='task list'
alias ta='task add'
alias td='task done'
alias tm='task modify'
alias vim='nvim'
alias pac='sudo pacman'
alias cr='cargo run'
alias cn='cargo new'
alias cb='cargo build'
alias py='python3'
alias ls='ls --color=always'
alias sl='ls'
alias r='ranger'
alias grep='grep --color=auto'
alias cx='chmod +x'
alias yt='youtube-dl'
alias yta='youtube-dl -x --audio-format mp3'
alias config='git --git-dir=$HOME/.dots/ --work-tree=$HOME'
alias ll='ls -lh'
alias nnn='nnn -Red'
alias lf='lfrun'

bindkey -s '^o' 'lfrun\n'

n() {
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

export MPD_HOST="127.0.0.1"
export MPD_PORT="6606"

## zsh powerline theme
# source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode dir)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)

eval "$(starship init zsh)"
## zsh syntax highlighting
# must be at the end of zshrc
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
