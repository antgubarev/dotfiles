#!/usr/bin/env bash

gbd() {
	local branch_to_delete
	branch_to_delete=$(git branch | fzf | xargs)

	if [ -n "$branch_to_delete" ]; then
		 git branch --delete --force "$branch_to_delete"
	fi
}

gcor() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
