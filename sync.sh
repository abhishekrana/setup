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
	echo ""

	echo "Syncing .vimrc"
	rsync -av vim/.vimrc ~/
	
	echo "Syncing bundle/aSk"
	mkdir -p ~/.vim/bundle/aSk/
	rsync -av vim/bundle/aSk/ ~/.vim/bundle/aSk/

	if [[ ! -f ~/.vim/bundle/Vundle.vim ]];then
		echo "Cloning Vundle Plugin"
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi

	if [[ ! -d ~/.tmux/plugins/tpm ]];then
		echo "Cloning Tmux Plugin Manager"
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	fi


elif [[ "$1" == "pull" ]];then
	echo ""
	echo "Updating Git Repository..."
	echo ""

	echo "Syncing .vimrc"
	rsync -av ~/.vimrc vim/
	
	echo "Syncing aSk"
	rsync -av ~/.vim/bundle/aSk/ vim/bundle/aSk/


elif [[ "$1" == "update" ]];then
	echo ""

	echo "Updating apt-get"
	sudo apt-get update

	echo "Upgrading tmux"
	sudo apt-get install -y python-software-properties software-properties-common
	sudo add-apt-repository -y ppa:pi-rho/dev
	sudo apt-get update
	sudo apt-get install -y tmux=2.0-1~ppa1~t

	echo "Upgrading vim"
	#sudo apt-get upgrade -y vim
	sudo apt-get install -y vim=2:7.4.843-1~ppa1~t
	
else
	echo ""
	echo "Invalid Argument"
	echo ""

	echo "push   - Sync from Git Repo to the system"
	echo "pull   - Sync from the system to the Git Repo"
	echo "update - Update current packages on the system"
	echo ""
fi

