# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

test -e ~/.iterm2_shell_integration.bash && source ~/.iterm2_shell_integration.bash || true

complete -C /opt/homebrew/bin/terraform terraform
