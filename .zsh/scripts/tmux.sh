#!/bin/bash

function tmv () {
	tmux split-window -h
	tmux resize-pane -L 80
}
