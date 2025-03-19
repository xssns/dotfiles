# ~/.bashrc
#

# Exit if not running interactively
[[ $- != *i* ]] && return

# Set vi mode
set -o vi

# Bind Ctrl+l to clear the screen
bind -x '"\C-l":clear'

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~

export VISUAL=nvim      # Preferred visual editor
export EDITOR="$VISUAL" # Default text editor

export BROWSER="firefox" # Default web browser

export REPOS="$HOME/Repos" # Shortcut to Repos directory
export DOCUMENTS="$HOME/Documents/"
export DOWNLOADS="$HOME/Downloads/"
export GITUSER="xssns"                                   # GitHub username
export GHREPOS="$REPOS/github.com/$GITUSER"              # GitHub repos directory
export DOTFILES="$HOME/Repos/github.com/xssns/dotfiles/" # Dotfiles directory
export SCRIPTS="$DOTFILES/scripts"                       # Scripts directory
export ICLOUD="$HOME/icloud"

# Development Environment Setup
export GOBIN="$HOME/.local/bin"                                # Go binaries path
export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*" # Private repos
export GOPATH="$HOME/go/"                                      # Go workspace
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"          # .NET install path

# ~~~~~~~~~~~~~~~ Path Configuration ~~~~~~~~~~~~~~~~~~~~~~~~

PATH="$PATH:$SCRIPTS:/opt/homebrew/opt/dotnet@6/bin:/opt/homebrew/opt/dotnet/bin:$HOME/.local/bin:$HOME/.dotnet/tools"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# ~~~~~~~~~~~~~~~ Command History Configuration ~~~~~~~~~~~~~~~~~~~~~~~~

export HISTFILE=~/.histfile    # History file path
export HISTSIZE=25000          # Number of commands to store
export SAVEHIST=25000          # Commands to save in history
export HISTCONTROL=ignorespace # Ignore commands that start with a space

# ~~~~~~~~~~~~~~~ Functions ~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~ Tmux ~~~~~~~~~~~~~~~~~~~~~~~~

# Check if tmux is available and not in a tmux session
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
	# Attach to "base" session or create it and source config if it doesn't exist
	tmux attach-session -t base 2>/dev/null || {
		tmux new-session -s base -d &&
			tmux source-file "${DOTFILES}.tmux.conf" &&
			tmux attach-session -t base
	} 2>/dev/null
fi

# ~~~~~~~~~~~~~~~ SSH ~~~~~~~~~~~~~~~~~~~~~~~~

# Start ssh-agent if not running
if ! pgrep -qf ssh-agent; then
	eval "$(ssh-agent -s)" >/dev/null
fi

# Automatically add SSH keys from ~/.ssh, excluding public keys (*.pub) and config files
for KEY in ~/.ssh/*; do
	if [[ -f "$KEY" && ! "$KEY" =~ \.pub$ && "$KEY" != *"config"* ]]; then
		# Check if the key is already added
		FINGERPRINT=$(ssh-keygen -lf "$KEY" | awk '{print $2}')
		if ! ssh-add -l | grep -q "$FINGERPRINT"; then
			ssh-add --apple-use-keychain "$KEY" >/dev/null 2>&1
		fi
	fi
done

# ~~~~~~~~~~~~~~~ Starship prompt ~~~~~~~~~~~~~~~~~~~~~~~~

eval "$(starship init bash)"

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

# Utils
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'

# Network
alias ports='lsof -i -P | grep -i "listen"'

# Editor shortcuts
alias v=nvim
alias sv='sudoedit'

# Directory navigation
alias ..='cd ..'
alias dot='cd $DOTFILES'
alias repos='cd $REPOS'
alias icloud='cd $ICLOUD'
alias scripts='cd $SCRIPTS'
alias docs='cd $DOCUMENTS'
alias down='cd $DOWNLOADS'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --graph --oneline --all --decorate'
alias lg='lazygit'

# System operations
alias e='exit'
alias c='clear'
alias t='tmux'
alias s='startx'

# Configurations management
alias ebr='v $DOTFILES/.bashrc'
alias ebp='v $DOTFILES/.bash_profile'
alias ev='cd ~/.config/nvim/ && v init.lua'
alias sbr='source $DOTFILES.bashrc'
alias sbp='source $DOTFILES.bash_profile'

# File management
alias ll='ls -la'
alias la='ls -lathr'
alias ls='ls --color=auto'
alias ffind='find . -name'
alias last='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'

# # Development tools
# alias tf='terraform'
# alias tp='terraform plan'
alias bss='browser-sync start --server --files "./*"'
alias sss='sass --watch style.scss:style.min.css --style=compressed'
#
# # Kubernetes and container management
# alias k='kubectl'
# alias kgp='kubectl get pods'
# alias kc='kubectx'
# alias kn='kubens'
# source <(kubectl completion bash)
# complete -o default -F __start_kubectl k
#
# # Flux
# source <(flux completion bash)
# alias fgk='flux get kustomizations'
#
# # Talos
# source <(talosctl completion bash)
#
# # EDB
# source <(kubectl-cnp completion bash)
#
# # Cilium
# source <(cilium completion bash)
#
# Fzf
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias vf='v $(fp)'

# Sourcing path
source "$HOME/.privaterc"

if [[ "$OSTYPE" == "darwin"* ]]; then
	source "$HOME/.fzf.bash"
	# echo "I'm on Mac!"

	# brew bash completion
	[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
else
	[ -f ~/.fzf.bash ] && source ~/.fzf.bash
fi

# Load additional configurations if they exist
[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"
[ -f "$HOME/.private_env" ] && source "$HOME/.private_env"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/ssns/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
