#!/bin/zsh
#===============================================================================
#
#          FILE: zshrc
#
#         USAGE: ./zshrc
#
#   DESCRIPTION: My ZSHRC file
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
export ZSH=$HOME/.oh-my-zsh;

export EDITOR='vim';	# vim is the default editor
export DISABLE_AUTO_TITLE=true;

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster";

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux docker mix kubectl asdf)

# Plugin Configuration
export TERM="screen-256color";
ZSH_TMUX_AUTOSTART=true;
ZSH_TMUX_AUTOQUIT=false;

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin";

autoload -U compinit
compinit

# This is a base file, intended to work in any environment. If there are changes
# that should be made for a give environment, they belong in a local zshrc.
LOCAL_RC="${HOME}/.zshrc.local"

if [[ -a "${LOCAL_RC}" ]]; then
  source "${LOCAL_RC}"
fi

source $ZSH/oh-my-zsh.sh;

PATH="$HOME/custom/scripts:${HOME}/custom/git-custom:${PATH}"
export DEVPATH="${HOME}/custom/scripts:${HOME}/custom/git-custom:${HOME}/custom/.auto-completions:${HOME}/dev:${HOME}/dev/go/src";
export fpath=("${HOME}/custom/.auto-completions" $fpath)

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# aliases

alias dc='docker-compose';
alias kc='kubectl';
alias m='make'
alias resource="source ${HOME}/.zshrc";
alias ta='tmux attach:';
alias tmuxrc="$EDITOR ${HOME}/.tmux.conf";
alias vimrc="$EDITOR ${HOME}/.vimrc";
alias x='exit';
alias xclip='xclip -selection clipboard';
alias zshrc="$EDITOR ${HOME}/.zshrc";

case $OSTYPE in
  darwin*) alias ls='ls -ahlFG';;
  solaris*) alias ls='ls -ahlF';;
  *) alias ls='ls -ahlvF --color --group-directories-first';;
esac

DEVENVSET_DIR="${HOME}/dev/devenvset";

function updatedots()
{
  copyDotFile ".tmux.conf" 	&& \
    copyDotFile ".vimrc" 	&& \
    copyDotFile ".bashrc" 	&& \
    copyDotFile ".zshrc" 	&& \
    copyDotFile ".psqlrc" 	&& \
    copyDotFile ".gitignore" 	&& \
    pushDevenvset;
}

function copyDotFile()
{
  DOT_FILE=$1;

  cp "${HOME}/${DOT_FILE}" "${DEVENVSET_DIR}/dotfiles";
}

function pushDevenvset()
{
  pushd .;
  cd ${DEVENVSET_DIR};

  git add .;
  git commit -v;
  git push origin master;
  popd;
}

function untrackedFiles()
{
  git ls-files --others --exclude-standard;
}

function script()
{
  SCRIPT_NAME=$1;
  SCRIPT_DIR="${HOME}/custom/scripts"
  FILE_NAME="${SCRIPT_DIR}/${SCRIPT_NAME}"

  vim "${FILE_NAME}";
  chmod u+x "${FILE_NAME}";
}

function dev()
{
  PROGRAM_NAME=${1};
  cd "${HOME}/dev/${PROGRAM_NAME}";
}

function edit()
{
	NAME="${1}";
	FILE=$(which "${NAME}");

	if [[ -a "${FILE}" ]]; then
		${EDITOR} "${FILE}";
	else
		echo "${NAME} does not exist";
	fi
}

function init-session()
{
	source $(which .init-session);
}

#[[ -n "${key[Up]}"  ]] && bindkey "${key[Up]}" up-line-or-beginning-search
#[[ -n "${key[Down]}"  ]] && bindkey "${key[Down]}" down-line-or-beginning-search

set -o vi;  			# Use vi mode in the shell

bindkey '^r' history-incremental-search-backward;

autoload -U edit-command-line;
zle -N edit-command-line;
bindkey -M vicmd v edit-command-line;

main_pane_height.sh;

GPG_TTY=$(tty);
export GPG_TTY;
