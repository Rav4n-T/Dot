# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

export FZF_DEFAULT_OPTS='--layout="reverse" --info="right" --preview-window="border-sharp" --scrollbar="|"
--color fg:242,bg:-1,hl:65,fg+:15,bg+:-1,hl+:108
--color info:108,prompt:109,spinner:108,pointer:168,marker:168
'

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='**'

# Options to fzf command
# export FZF_COMPLETION_OPTS='--border --info=inline'

# Options for path completion (e.g. vim **<TAB>)
export FZF_COMPLETION_PATH_OPTS='--walker file,dir,follow,hidden'

# Options for directory completion (e.g. cd **<TAB>)
export FZF_COMPLETION_DIR_OPTS='--walker dir,follow,hidden'

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments ($@) to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'if [ -d {} ]; then tree -C {} || echo "No preview for directory"; else bat --style=plain --color=always {} || echo "No preview for file"; fi' "$@" ;;
  esac
}
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

bind -x '"\t": fzf_bash_completion'
