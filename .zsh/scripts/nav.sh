#!/bin/bash

function cdp() {
	local path
	pp=$PROJECT_PATH
	path=eval $(ls "$pp" | fzf)
	
	cd "$PROJECT_PATH/$path"

	changes=$(git status --porcelain)
	if [ -z "$changes" ]
	then
		git checkout master
		git pull origin master
	else
		echo "There are uncommited changes. Can't checkout and update master"
	fi
}
