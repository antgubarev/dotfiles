#!/usr/bin/env bash

gps() {
	local branch=$(git rev-parse --abbrev-ref HEAD)
	print -z "git push origin $branch"
}
