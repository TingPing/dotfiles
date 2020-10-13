# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source bash-git-prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
	GIT_PROMPT_THEME=Custom
	GIT_PROMPT_ONLY_IN_REPO=1
	. $HOME/.bash-git-prompt/gitprompt.sh
fi

# User specific environment
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export EDITOR=nano
export VISUAL='code --new-window --wait'
PROMPT_DIRTRIM=2
PS1="[\e[33m\w\e[0m] "

# User specific aliases and functions

# Meson
function mb {
	if [ -z $JHBUILD_PREFIX ]; then
		meson _build $*
	else
		meson _build --prefix=$JHBUILD_PREFIX --libdir=$JHBUILD_LIBDIR $*
	fi
}

# alias mb='meson _build'
alias mc='meson compile -C _build'
alias mt='meson test -C _build'
alias mi='meson install -C _build'

# JHBuild
