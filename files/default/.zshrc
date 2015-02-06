#!/usr/local/bin/zsh  
#===============================================================================
#
#          FILE: zshrc
# 
#         USAGE: ./zshrc 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Cody Poll (CJPoll), CJPoll@gmail.com
#  ORGANIZATION: PollSoft
#       CREATED: 04/23/2013 13:02:19 MDT
#      REVISION:  ---
#===============================================================================
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export EDITOR='vim'	# vim is the default editor

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux wd)

# Plugin Configuration
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=false

# User configuration

export PATH="/usr/local/sbin:/Users/cjpoll/.rvm/gems/ruby-2.1.5/bin:/Users/cjpoll/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Users/cjpoll/.rvm/gems/ruby-2.1.5/bin:/Users/cjpoll/.rvm/gems/ruby-2.1.5@global/bin:/Users/cjpoll/.rvm/rubies/ruby-2.1.5/bin:/usr/local/heroku/bin"

export NVM_DIR="/Users/cjpoll/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#source $(brew --prefix nvm)/nvm.sh
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

case $OSTYPE in
	darwin*) alias ls='ls -ahlFG';; 
	solaris*) alias ls='ls -ahlF';;
	*) alias ls='ls -ahlvF --color --group-directories-first';;
esac

DEVENVSET_DIR="${HOME}/developer/devenvset";

function updatedots()
{
	copyDotFile "${HOME}/.tmux.conf" 	&& \
		copyDotFile "${HOME}/.vimrc" 	&& \
		copyDotFile "${HOME}/.bashrc" 	&& \
		copyDotFile "${HOME}/.zshrc" 	&& \
		pushDevenvset;
}

function copyDotFile()
{
	DOT_FILE="$1";
	COPY_DIR="${DEVENVSET_DIR}/files/default";

	if [[ ! -d "${COPY_DIR}" ]]; then
		echo "No such copy dir: ${COPY_DIR}";
		return 1;
	fi
		echo "Currently in $(pwd)";
		echo "Copying ${DOT_FILE} to ${COPY_DIR}";

		cp "${DOT_FILE}" "${COPY_DIR}";
		echo "Copied ${DOT_FILE} to ${COPY_DIR}";
}

function pushDevenvset()
{
	echo "Currently in $(pwd)";
	echo "Pushing $(pwd)";
	pushd "$(pwd)";
	echo "Pushed $(pwd)";
	cd ${DEVENVSET_DIR};
	echo "Currently in $(pwd)";

	git add .;
	git commit -v;
	git push origin master;

	popd;
	echo "Currently in $(pwd)";
}

function untrackedFiles()
{
	git ls-files --others --exclude-standard;
}

alias resource="source ${HOME}/.zshrc"
alias tmuxrc="$EDITOR ${HOME}/.tmux.conf"
alias vimrc="$EDITOR ${HOME}/.vimrc"
alias x='exit'
alias zshrc="$EDITOR ${HOME}/.zshrc"

set -o vi  			# Use vi mode in the shell

