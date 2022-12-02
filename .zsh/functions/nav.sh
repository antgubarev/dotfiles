#!/bin/bash

function cdp() {
	IFS=';' read -A PD <<< "$PROJECT_PATHES"
	local targets
	for i in "${PD[@]}"; 
	do
		targets+=($(exa -d $HOME/$i/*))
	done

	local targetDir=$(printf "%s\n" ${targets[@]} | fzf )
	if [ -d $targetDir ] 
	then
		echo "$targetDir is picked"
	else
		echo "$targetDir is not a directory"
		return 1
	fi

	cd $targetDir

	if [ -d ".git" ] 
	then
		echo "checking git status"
	else
		echo "directory doesn't contain git"
		return 0
	fi

	local changes=$(git status --porcelain)
	if [ -z "$changes" ]
	then
		echo "updating master"
		git checkout master
		git pull origin master
	else
		echo "There are uncommited changes. Can't checkout and update master"
	fi
}
