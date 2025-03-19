# Only run on macOS

if [[ "$OSTYPE" == "darwin"* ]]; then
	# needed for brew
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -r ~/.bashrc ]; then
	source ~/.bashrc
fi

export XDG_CONFIG_HOME="$HOME"/.config

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/ssns/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# Java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk"

# Starship
export STARSHIP_CONFIG=~/Repos/github.com/xssns/dotfiles/starship/starship.toml

# Bash silence
export BASH_SILENCE_DEPRECATION_WARNING=1

# Setting PATH for Python 3.12
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
export PATH
