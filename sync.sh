#!/bin/bash

# Title			: sync.sh
# Author		: _aSk
# Description	: This script is used to sync vim configuration and dependencies
#				  to and from the system
# Parameters	: push   - Sync from Git Repo to the system
#				  pull   - Sync from the system to the Git Repo
#				  update - Update current packages on the system

if [[ "$1" == "push" ]];then
	echo ""
	echo "Deploying..."


	### VIM
	echo ""
	echo "Syncing .vimrc"
	rsync -a vim/.vimrc ~/
	
	echo "Syncing bundle/aSk"
	mkdir -p ~/.vim/bundle/aSk/
	rsync -a vim/bundle/aSk/ ~/.vim/bundle/aSk/

	if [[ ! -d ~/.vim/bundle/Vundle.vim ]];then
		echo "Cloning Vundle Plugin"
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi


	### TMUX
	echo ""
	echo "Syncing .tmux.conf"
	rsync -a tmux/.tmux.conf ~/

	if [[ ! -d ~/.tmux/plugins/tpm ]];then
		echo "Cloning Tmux Plugin Manager"
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	fi


	### BASH
	echo ""
	echo "Syncing .bashrc_aSk"
	rsync -a bash/.bashrc_aSk ~/

	grep "bashrc_aSk" ~/.bashrc > /dev/null
	if [[ $? == 1 ]];then
		echo "" >> ~/.bashrc
		echo "# aSk" >> ~/.bashrc
		echo "source ~/.bashrc_aSk" >> ~/.bashrc
	fi


	echo ""
	echo "TODO:"
	echo ""

	echo "vim - YouCompleteMe:"
	echo "cd ~/.vim/bundle/YouCompleteMe"
	echo "./install.py --clang-completer"
	echo ""

	echo "bash-completion:"
	echo "Edit the prompt line in .bashrc : export PS1='\$(__git_ps1) \w\$'"


elif [[ "$1" == "pull" ]];then

	echo "Are you sure? (y/n)"
	read input
	if [[ $input != "y" ]];then
		exit 0
	fi

	echo ""
	echo "Updating Git Repository..."
	echo ""


	### VIM
	echo ""
	echo "Syncing .vimrc"
	rsync -a ~/.vimrc vim/
	
	echo "Syncing aSk"
	rsync -a ~/.vim/bundle/aSk/ vim/bundle/aSk/


	### TMUX
	echo ""
	echo "Syncing .tmux.conf"
	rsync -a ~/.tmux.conf tmux/


elif [[ "$1" == "update" ]];then
	echo ""

	### REPOSITORY
	echo ""
	echo "Adding Repostories"
	# Tmux
	dpkg -p tmux > /dev/null 2>&1
	if [[ $? != 0 ]];then
		echo "Adding Repo for Tmux"
		sudo add-apt-repository -y ppa:pi-rho/dev
		sudo apt-get install -y python-software-properties software-properties-common
	fi
	# Variety
	dpkg -p variety > /dev/null 2>&1
	if [[ $? != 0 ]];then
		echo "Adding Repo for Variety"
		sudo add-apt-repository -y ppa:peterlevi/ppa
	fi
	# Spotify
	dpkg -p spotify-client > /dev/null 2>&1
	if [[ $? != 0 ]];then
		echo "Adding Repo for Spotify"
		sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
		echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	fi
	# y-ppa-manager
	dpkg -p y-ppa-manager > /dev/null 2>&1
	if [[ $? != 0 ]];then
		echo "Adding Repo for y-ppa-manager"
		sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
	fi


	### APT-UPDATE
	echo ""
	echo "Updating apt-get"
	sudo apt-get update


	### TMUX
	echo ""
	local tmuxVersion=$(tmux -V)
	if [[ $tmuxVersion != "tmux 2.0" ]];then
		echo "Upgrading tmux..."
		# sudo apt-get install -y python-software-properties software-properties-common
		# sudo add-apt-repository -y ppa:pi-rho/dev
		# sudo apt-get update
		sudo apt-get install -y tmux=2.0-1~ppa1~t
	else
		echo "Tmux already latest"
	fi


	### VIM
	echo ""
	echo "Upgrading vim"
	# sudo apt-get upgrade -y vim
	# sudo apt-get install -y vim=2:7.4.843-1~ppa1~t


	### BASH-COMPLETION
	echo ""
	echo "Installing bash-completion..."
	sudo apt-get install -y bash-completion
	# echo "TODO: For bash-completion, edit the prompt line in .bashrc : export PS1='\$(__git_ps1) \w\$'"


	### GIT-PROMPT
	echo ""
	if [[ ! -f ~/.git-prompt.sh ]];then
		echo "Installing git-prompt..."
		wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
	else
		echo "git-prompt already installed"
	fi


	### YOU-COMPLETE-ME
	echo ""
	echo "vim - YouCompleteMe:"
	sudo apt-get install -y build-essential cmake
	sudo apt-get install -y python-dev


	### CTAGS
	echo ""
	dpkg -p ctags > /dev/null 2>&1
	if [[ $? != 0 ]];then
		echo "Installing Ctags..."
		sudo apt-get install -y ctags
	else
		echo "Ctags already installed"
	fi


	### TERMINATOR
	echo ""
	dpkg -p terminator > /dev/null 2>&1
	if [[ $? != 0 ]];then
		echo "Installing Terminator..."
		sudo apt-get install -y terminator
	else
		echo "Terminator already installed"
	fi


	### GIT
	echo ""
	dpkg -p git > /dev/null 2>&1
	if [[ $? != 0 ]];then
		echo "Installing Git..."
		sudo apt-get install -y git
	else
		echo "Git already installed"
	fi

		
	### DROPBOX
	echo ""
	dpkg -p dropbox > /dev/null 2>&1
	if [[ $? != 0 ]];then
		echo "Installing Dropbox..."
		wget https://linux.dropbox.com/packages/ubuntu/dropbox_2015.02.12_amd64.deb
		sudo dpkg -i dropbox_2015.02.12_amd64.deb
		rm -f dropbox_2015.02.12_amd64.deb
	else
		echo "Dropbox already installed"
	fi


	### VARIETY
	echo ""
	dpkg -p variety > /dev/null 2>&1
	if [[ $? != 0 ]];then
		echo "Installing Variety..."
		# sudo add-apt-repository ppa:peterlevi/ppa
		# sudo apt-get update
		sudo apt-get install -y variety
	else
		echo "Variety already installed"
	fi


	### EASYSTROKE
	echo ""
	dpkg -p easystroke > /dev/null 2>&1
	if [[ $? != 0 ]];then
		echo "Installing Easystroke..."
		sudo apt-get install -y easystroke
	else
		echo "Easystroke already installed"
	fi


	### SPOTIFY
	echo ""
	dpkg -p spotify-client > /dev/null 2>&1
	if [[ $? != 0 ]];then
		echo "Installing Spotify..."
		# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
		# echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
		# sudo apt-get update
		sudo apt-get install -y spotify-client
	else
		echo "Spotify already installed"
	fi


	### ZIM
	echo ""
	dpkg -p zim > /dev/null 2>&1
	if [[ $? != 0 ]];then
		echo "Installing Zim"
		sudo apt-get install -y zim

		# Upgrade Zim
		wget http://zim-wiki.org/downloads/zim_0.63_all.deb -O zim_0.63_all.deb
		dpkg -i zim_0.63_all.deb
		rm -f zim_0.63_all.deb

		# Source View Plugin
		sudo apt-get install -y python-gtksourceview2

	else
		echo "Zim already installed"
	fi


	### TEAMVIEWER
	echo ""
	dpkg -p teamviewer > /dev/null 2>&1
	if [[ $? != 0 ]];then
		echo "Installing Teamviewer"
		wget http://www.teamviewer.com/download/teamviewer_linux.deb -O teamviewer_linux.deb
		sudo dpkg --add-architecture i386
		sudo apt-get update
		sudo apt-get install gdebi
		sudo gdebi --n teamviewer_linux.deb
		rm -f teamviewer_linux.deb
	else
		echo "Teamviewer already installed"
	fi


	echo ""
	sudo apt-get install -y vlc gimp y-ppa-manager flashplugin-installer unrar rar vnstat vnstati

	echo ""
	sudo apt-get install -y openjdk-7-jre
	# sudo apt-get install -y oracle-java8-installer

	
else
	echo ""
	echo "Invalid Argument"
	echo ""

	echo "push   - Sync from Git Repo to the system"
	echo "pull   - Sync from the system to the Git Repo"
	echo "update - Update current packages on the system"
	echo ""
fi

