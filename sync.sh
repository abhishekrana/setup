#!/bin/bash

# Title			: sync.sh
# Author		: _aSk
# Description	: This script is used to sync vim configuration and dependencies
#				  to and from the system
# Parameters	: deploy - Sync dependencies from Git Repo to the system
#				  update - Sync dependencies from the system to the Git Repo

if [[ "$1" == "deploy" ]];then
	echo ""
	echo "Deploying..."
	echo ""

	echo "Syncing .vimrc"
	rsync -av vim/.vimrc ~/
	
	echo "Syncing bundle/aSk"
	mkdir -p ~/.vim/bundle/aSk/
	rsync -av vim/bundle/aSk/ ~/.vim/bundle/aSk/

elif [[ "$1" == "update" ]];then
	echo ""
	echo "Updating Git Repository..."
	echo ""

	echo "Syncing .vimrc"
	rsync -av ~/.vimrc vim/
	
	echo "Syncing aSk"
	rsync -av ~/.vim/bundle/aSk/ vim/bundle/aSk/

else
	echo ""
	echo "Invalid Argument"
	echo ""

	echo "deploy - Sync dependencies from Git Repo to the system"
	echo "update - Sync dependencies from the system to the Git Repo"
	echo ""
fi

