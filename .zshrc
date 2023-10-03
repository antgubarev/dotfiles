# additional sources 
source ~/.zsh/prompt.sh
source ~/.zsh/.env.sh
source /usr/local/share/zsh-abbr/zsh-abbr.zsh

for function in ~/.zsh/functions/*; do
  source $function
done

# options
setopt share_history # share command history between sessions

# alias
alias czrc="nvim ~/.zshrc"
alias czsh="nvim ~/.zsh/"
alias cvm="nvim ~/.config/nvim/"

#gpg
export GPG_TTY=$(tty)

#protobuf
export PATH="$PATH:$(go env GOPATH)/bin"

# psql
export PATH="/usr/local/opt/libpq/bin:$PATH"

#lf
source ~/.config/lf/lfcd.sh
export LF_BOOKMARK_PATH=$HOME'/.config/lf/.bookmarks'

_zlf() {
   emulate -L zsh
   local d=$(mktemp -d) || return 1
   {
      mkfifo -m 600 $d/fifo || return 1
      tmux split -bf zsh -c "exec {ZLE_FIFO}>$d/fifo; export ZLE_FIFO; exec lf" || return 1
      local fd
      exec {fd}<$d/fifo
      zle -Fw $fd _zlf_handler
   } always {
      rm -rf $d
   }
}
zle -N _zlf
bindkey '^k' _zlf

_zlf_handler() {
   emulate -L zsh
   local line
   if ! read -r line <&$1; then
      zle -F $1
      exec {1}<&-
      return 1
   fi
   eval $line
   zle -R
}
zle -N _zlf_handler

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

# zsh-completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit

	 zstyle ':completion:*' menu select  # Nice styling for completion
	 zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'  # Case insensitive completion
	 zstyle ':completion:*' expand prefix suffix  # Do not require typing beginning of filename for completion

    zstyle ':completion:*:*:*:*:descriptions' format '-- %d --'
    zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
	 zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

	 # Completion caching
	 zstyle ':completion:*' use-cache on
	 zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
fi

# direnv
eval "$(direnv hook zsh)"

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/Users/antgubarev/yandex-cloud/path.bash.inc' ]; then source '/Users/antgubarev/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/Users/antgubarev/yandex-cloud/completion.zsh.inc' ]; then source '/Users/antgubarev/yandex-cloud/completion.zsh.inc'; fi



