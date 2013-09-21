#!/bin/bash  
#===============================================================================
#
#          FILE: bashrc
# 
#         USAGE: ./bashrc 
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

########################
##
## Custom Stuff
##
########################

set -o vi  			# Use vi mode in the shell

export EDITOR='vim'	# vim is the default editor

# Uncomment if you want tmux to automatically start up. Reattaching becomes a
# pain if you do, though.
# if [[ ! $TERM =~ screen ]]; then
#     exec tmux
# fi


#bundle ()
#{
#	vim +BundleInstall +qa
#}	# ----------  end of function bundle  ----------

vimplugs ()
{
	vim ~/.vim_plugins
}	# ----------  end of function vimplugs  ----------

vmlist ()
{
	RUN=$1
	if [ -z "$RUN" ]
	then
		VBoxManage list vms
	else
		echo "Running VMs: "
		VBoxManage list runningvms
	fi

}	# ----------  end of function vmlist  ----------

vmssh ()
{
	USER=$1
	if [ -z "$USER" ]; then
		USER="cjpoll"
	fi
	ssh -p 2222 "$USER"@127.0.0.1
}	# ----------  end of function vmssh  ----------


vmscreen ()
{
	ETH=$(ipconfig getifaddr en0)
	if [ -z "$ETH" ]
	then
		WIFI=$(ipconfig getifaddr en1)
		if [ -z "$WIFI" ]
		then
			echo "No network connection detected"
			return 1
		else
			echo "Wireless connection detected"
			IP=$(ipw)
		fi
	else
		echo "Ethernet connection detected"
		IP=$(ipe)
	fi

	rdesktop "$IP"

}	# ----------  end of function vmscreen  ----------

vmnet ()
{
	MACHINE="$1"
	
	VBoxManage modifyvm $MACHINE --natpf1 "guestssh,tcp,127.0.0.1,2222,,22"

	ETH=$(ipconfig getifaddr en0)
	if [ -z "$ETH" ]
	then
		WIFI=$(ipconfig getifaddr en1)
		if [ -z "$WIFI" ]
		then
			echo "No network connection detected"
			return 1
		else
			echo "Wireless connection detected"
			IP=$(ipw)
		fi
	else
		echo "Ethernet connection detected"
		IP=$(ipe)
	fi

	vmvrde $MACHINE $IP
}	# ----------  end of function vmnet  ----------

startvm ()
{
	if [ -z "$1" ]	
	then
		echo "Function needs a parameter"
		return 1
	fi

	MACHINE=$1
	vmnet $MACHINE

	if [ -z "$2" ]
	then
		VBoxManage startvm "$MACHINE" --type headless
	else
		if [ "$2" = "head" ]
		then
			VBoxManage startvm "$MACHINE" --type headless
			if [ -z "$3" ]
			then
				rdesktop $(ipw)
			else
				rdesktop $(ipe)
			fi
		fi
	fi
}	# ----------  end of function startvm  ----------


stopvm ()
{
	if [ -z "$1" ]
	then
		echo "Function needs a parameter"
		return 1
	else
		VBoxManage controlvm "$1" poweroff
	fi
}	# ----------  end of function stopvm  ----------


savevm ()
{
	if [ -z "$1" ]
	then
		echo "Function needs a parameter"
		return 1
	else
		VBoxManage controlvm "$1" savestate
	fi
}	# ----------  end of function savevm  ----------


vmvrde ()
{
	if [ -z "$1" ]
	then
		echo "Need a VM name to work on"
		return 1
	fi

	if [ -z "$2" ]
	then
		echo "Need an ip address"
		return 1
	fi

	VBoxManage modifyvm "$1" --vrde on --vrdeaddress "$2"
	return 0

}	# ----------  end of function vmvrde  ----------

updatedots ()
{
	cp ~/.bashrc ~/devenvset/bashrc
	cp ~/.vimrc ~/devenvset/vimrc
	cp ~/.tmux.conf ~/devenvset/tmux.conf

	pushd .
	cd ~/devenvset
	git add .
	git commit -v
	git push
	popd
}	# ----------  end of function updatedots  ----------

mkdr ()
{
	if [ -z $1 ]
	then
		echo "Need directory name"
	else
		mkdir -p $1
		cd $1
	fi
}	# ----------  end of function mkdir  ----------

listvms ()
{
	if [ -z "$1" ]
	then
		VBoxManage list vms
	else
		VBoxManage list runningvms
	fi
}	# ----------  end of function listvms  ----------

erlrel ()
{
	APPLICATION="${PWD##*/}"
	./rel/$APPLICATION/bin/$APPLICATION console
}	# ----------  end of function erlrel  ----------

case $OSTYPE in
	darwin*) alias ls='ls -ahlFG';; 
solaris*) alias ls='ls -ahlF'
	alias gem='gem19';;
*) alias ls='ls -hlvF --color --group-directories-first';;
esac

# Get IP address of wireless connection
alias 'ip'='ipconfig getifaddr en1'

# Explicitly get IP address of wireless connection
alias 'ipw'='ipconfig getifaddr en1'

# Get IP address of Ethernet connection
alias 'ipe'='ipconfig getifaddr en0'

#alias ack='ack-grep'
alias apt-get='sudo apt-get'
alias bashrc="$EDITOR ~/.bashrc"
alias ex='exit'
alias les='ls | less'
alias g='grep'
alias jvim='vim ./src/* ./test/* ./Makefile'
alias mkdir='mkdir -p'
alias more='less'
alias ps='ps aux | g'
alias search='apt-cache search'
alias tmux='tmux -2'
alias tmuxrc='vim ~/.tmux.conf'
alias resource='source ~/.bash_profile'
alias rvim='vim *.rb spec/*.rb'
alias vbox='vboxmanage'
alias vi='vim'
alias vim='vim'
alias vimerl='vim apps/*/src/*.?rl apps/*/test/*.?rl apps/*/include/*.?rl apps/*/test/*/*.?rl Makefile rebar.config'
alias vimrc="$EDITOR ~/.vimrc"
alias vm='vim'
alias wget='wget -nc'
alias x='exit'

alias serv='python -m SimpleHTTPServer'
alias ...='cd ..'

################################################################################
##
## Git Stuff
##
################################################################################
alias add='git add'
alias blame='git blame'
alias branch='git branch'
alias checkout='git checkout'
case $OSTYPE in
	solaris*)
		alias clone='git clone -c http.sslVerify=false';;
esac
alias commit='git commit -v'
alias diff='git diff'
alias log='git log'
alias pull='git pull'
alias push='git push'
alias rebase='git rebase'
alias rem='git rm'
alias stash='git stash'
alias status='git status'
alias up='git up'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
