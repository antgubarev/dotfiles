#!/usr/bin/env bash
# https://github.com/olets/zsh-abbr

#git
abbr gc='git commit -m' 
abbr gca='git commit --amend -m' 
abbr gs='git status -sb' 
abbr ga='git add' 
abbr gco='git checkout' 
abbr gl='git pull origin' 
abbr gp='git push origin' 
abbr gst='git stash' 
abbr grhh='git reset --hard HEAD' 

#docker
abbr d='docker' 
abbr di='docker images'
abbr dps='docker ps -a'
abbr cdt='cd (mktemp -d)' 

# kubectl
abbr k='kubectl' 
abbr ka='kubectl apply -f'
abbr kg='kubectl get'
abbr kgp="kubectl get pod"
abbr kcuc='kubectl config use-context' 

#ansible
abbr anp='ansible-playbook' 
abbr an='ansible' 
abbr ang='ansible-galaxy' 

#tmux
abbr tmls='tmux ls'
abbr tmas='tmux attach-session -t'
abbr tmks='tmux kill-session -t'
abbr tmns='tmux new-session'
 
#misc
abbr ff='lfcd'
abbr v='nvim' 
abbr ll="exa -hla --git --icons"
