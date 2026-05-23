# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
export PATH="$HOME/.cargo/bin:$PATH"

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init bash)"

export MANPAGER='nvim +Man!'

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# LS when you CD
function cl() {
  cd "$1" && ls -la
}

export EDITOR=nvim

# Ctrl-T to fuzzy find files and paste into command line
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"
# Ctrl-R for better history search
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap"
# Alt-C to cd into subdirectories
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

# -----------
# ALIASES
# -----------
alias neofetch='fastfetch'
alias vim='nvim'
alias cat='bat'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'
alias -- -='cd -'

# List
alias ll='ls -alF'
alias lt='ls -ltr' # List by time, newest last

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gco='git checkout'

# Reload shell config after editing
alias reload='source ~/.bashrc'
