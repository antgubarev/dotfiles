git_branch_name() {
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo ' - ('$branch')'
  fi
}

preexec() {
  cmd_start="$SECONDS"
}

precmd() {
  local cmd_end="$SECONDS"
  elapsed=$((cmd_end-cmd_start))
  export RPROMPT="%F{226}${elapsed}ms %f" 
}

setopt prompt_subst
PROMPT='%2~%B%F{75}$(git_branch_name) >%f%b '
