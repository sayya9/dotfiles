# .bashrc

if [ `uname` == 'Darwin' ]; then
    source ~/.macrc
elif [ `uname` == 'Linux' ]; then
    source ~/.linuxrc
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

# Global aliases and functions
alias s='sudo'
alias sw='sudo su -'
alias grep='grep --color'

# docker completion
eval "$(docker completion bash)"

# git completion
if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
  . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

# kubectl and helm autocompletion
for x in kubectl helm; do
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

# brew completion
eval "$(/opt/homebrew/bin/brew shellenv)"

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
