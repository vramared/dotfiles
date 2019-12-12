#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# disable <C-s>
[[ $- == *i* ]] && stty -ixon

# Prompt
function git_prompt() {
    git_branch=`git branch 2>/dev/null | grep ^* | awk '{print $2}'`
    if [ -n "$git_branch" ]; then
        echo " ($git_branch)"
    fi
}

# Environment variables
export PATH="$HOME/bin:$PATH"
export PS1="\[\e[93;1m\][\h:\W\[\$(git_prompt)\]]\\$ \[\e[m\]"
#export PS1="\[\e[31;1m\]\$(nonzero_return)\[\e[93;1m\][\h:\w\[\$(git_prompt)\]]\\$ \[\e[m\]"
export HISTCONTROL=ignoreboth:erasedups
export LS_COLORS=$LS_COLORS':di=0;35:'
export EDITOR="vim"
export GOPATH=$HOME/go

# Aliases
alias v='vim'
alias tmux='tmux -2'
alias ls="ls --color=auto"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gl="git log --oneline -20"
alias gb="git branch"
alias py='python3'

umask 0077

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
if command -v fzf; then
    # if fd is not available
    export FZF_DEFAULT_COMMAND="find . ! -name '*.swp' ! -name '.git'"
    export FZF_ALT_C_COMMAND="find"
    #export FZF_DEFAULT_COMMAND="fd --hidden --no-ignore --exclude .git --exclude *.swp"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    #export FZF_ALT_C_COMMAND="fd --type d"
    export FZF_DEFAULT_OPTS="
        --multi --no-reverse --inline-info
        --bind ctrl-f:page-down,ctrl-b:page-up"
    export FZF_TMUX=1

    bind "$(bind -s | grep '^"\\C-r"' | grep -v '\\C-m' | sed 's/^"\\C-r/\\C-f"/')"
    bind "$(bind -s | grep '^"\\C-r"' | grep -v '\\C-m' | sed 's/"$/\\C-m"/')"
fi
export PATH=$PATH:$HOME/.npm-global/bin
