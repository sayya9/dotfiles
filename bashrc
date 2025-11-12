# .bashrc

if [ -n "$PS1"  ]; then
    if [ `uname` == 'Darwin' ]; then
        source ~/.macrc
    elif [ `uname` == 'Linux' ]; then
        source ~/.linuxrc
    fi
fi

# Source global definitions
if [ -x /etc/bashrc ]; then
    . /etc/bashrc
fi

export PS1="\[\033[38;5;184m\]\h \[\033[32m\][\w]\[\033[0m\]\n\[\033[1;34m\][\!]\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"
export EDITOR=vim
export LANG=en_US.UTF-8
export PATH=/opt/homebrew/bin:/opt/bin:$PATH
export GOPATH=~/go
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Global aliases and functions
alias s='sudo'
alias sw='sudo su -'
alias grep='grep --color'

# docker completion
eval "$(docker completion bash)"

# Enable bash completion (needed for _filedir and other helper functions)
if [ -f /opt/homebrew/etc/bash_completion ]; then
    source /opt/homebrew/etc/bash_completion
elif [ -f /usr/local/etc/bash_completion ]; then
    source /usr/local/etc/bash_completion
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# --- Cilium & Hubble Bash Completion Setup ---
if command -v brew >/dev/null 2>&1; then
    completion_dir="$(brew --prefix)/etc/bash_completion.d"
    mkdir -p "$completion_dir"

    setup_completion() {
        local cmd=$1
        local file="$completion_dir/$cmd"
        if command -v "$cmd" >/dev/null 2>&1; then
            if [ ! -f "$file" ]; then
                echo "Generating bash completion for $cmd..."
                "$cmd" completion bash > "$file"
            fi
            [ -f "$file" ] && source "$file"
        fi
    }

    setup_completion cilium
    setup_completion hubble
fi

# autocompletion
for x in kubectl helm cilium hubble; do
    path=`which $x 2> /dev/null`
    if [ -f "$path" ]; then
        . <(${x} completion bash)
    fi
done

# aws command completion
if which aws_completer > /dev/null 2>&1; then
    complete -C '/usr/local/bin/aws_completer' aws
fi

# gh completion
if which gh > /dev/null 2>&1; then
    eval "$(gh completion -s bash)"
fi

# tmux completion
. ~/.tmux-bash-completion.bash

# Enable ssh-agent
SSH_ENV="$HOME/.ssh/environment"

start_agent () {
    echo "Initialising new SSH agent..."
    ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    # ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    if find ~/.ssh -type f -perm 0600 | grep -q id_rsa; then
        start_agent;
    fi
fi
