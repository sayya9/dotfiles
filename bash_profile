# .bash_profile
#
eval "$(/opt/homebrew/bin/brew shellenv)"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

test -e ~/.iterm2_shell_integration.bash && source ~/.iterm2_shell_integration.bash || true

complete -C /opt/homebrew/bin/terraform terraform

complete -C /opt/homebrew/bin/vault vault

complete -C /opt/homebrew/bin/nomad nomad
. "$HOME/.cargo/env"

