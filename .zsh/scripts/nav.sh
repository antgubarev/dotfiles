#!/bin/bash

function cdp() {
	local dirPathes
	IFS=';' 
	read -A PD <<< "$PROJECT_PATHES"
	for i in "${PD[@]}"; 
	do
		local dd=$(ls -d $HOME/$i/*)
		dirPathes=("${dirPathes} ${dd}")
	done

	local targerDir=$(echo $dirPathes | fzf)
	cd $targerDir

	local changes=$(git status --porcelain)
	if [ -z "$changes" ]
	then
		git checkout master
		git pull origin master
	else
		echo "There are uncommited changes. Can't checkout and update master"
	fi
}
