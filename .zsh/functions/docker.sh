#!/bin/bash

function drmi() {
	docker images | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $3 }' | xargs -r docker rmi	
}

function ds() {
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')
	[ -n "$cid" ] && docker stop "$cid"
}

function drm() {
  cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')
  [ -n "$cid" ] && docker rm "$cid"
}
