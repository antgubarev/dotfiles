#!/bin/bash

function cdp() {
	local dirPathes
	IFS=';' 
	read -A PD <<< "$PROJECT_PATHES"
	for i in "${PD[@]}"; 
	do
		local dd=$(exa -d $HOME/$i/*)
		dirPathes=("${dirPathes[@]}" "\n" "${dd[@]}")
	done

	local targerDir=$(echo ${dirPathes} | fzf)
	targerDir=$(echo ${targerDir} | xargs)
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
