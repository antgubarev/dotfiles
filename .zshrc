if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# secrets
source ~/.zsh/.env.sh

# abbr
source /usr/local/share/zsh-abbr/zsh-abbr.zsh

for script in ~/.zsh/scripts/*; do
  source $script
done

# psql
export PATH="/usr/local/opt/libpq/bin:$PATH"

#lf
# https://github.com/gokcehan/lf/wiki/Tutorial#working-directory
source ~/.config/lf/lfcd.sh
export LF_BOOKMARK_PATH=$HOME'/.config/lf/.bookmarks'

# bat
export BAT_THEME='Visual Studio Dark+'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# fzf
export FZF_DEFAULT_OPTS="--no-mouse --height 80% --border --reverse --multi --info=inline --preview-window='right:60%:wrap' --bind='ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-y:execute-silent(echo {+} | pbcopy),ctrl-x:execute(rm -i {+})+abort,ctrl-l:clear-query'"
export FZF_COMPLETION_OPTS='--border --info=inline'
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# for fzf '**' shell completions.
# - The first argument to the function ($1) is the base path to start traversal
_fzf_compgen_path() {
  command fd --hidden --follow --exclude .git --exclude node_modules . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  command fd --type d --hidden --follow --exclude .git --exclude node_modules . "$1"
}

# direnv
eval "$(direnv hook zsh)"
