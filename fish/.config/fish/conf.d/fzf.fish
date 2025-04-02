fzf --fish | source

set -Ux FZF_DEFAULT_OPTS "\
--color=spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
--color=selected-bg:#51576d \
--color=border:#414559,label:#c6d0f5 \
--layout='reverse' \
--info='right' \
--preview-window='border-sharp' \
--scrollbar='|'
"

# Use ~~ as the trigger sequence instead of the default **
set -x FZF_COMPLETION_TRIGGER '&&'

# Options to fzf command
# set -x FZF_COMPLETION_OPTS='--border --info=inline'

# Options for path completion (e.g. vim **<TAB>)
set -x FZF_COMPLETION_PATH_OPTS '--walker file,dir,follow,hidden'

# Options for directory completion (e.g. cd **<TAB>)
set -x FZF_COMPLETION_DIR_OPTS '--walker dir,follow,hidden'

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments ($@) to fzf.

function _fzf_comprun
    set -l command $argv[1]
    set -e argv[1]  # 移除第一个参数（命令名）

    switch $command
        case cd
            fzf --preview 'tree -C {} | head -200' $argv
        case export unset
            fzf --preview "eval 'echo \$'{}" $argv
        case ssh
            fzf --preview 'dig {}' $argv
        case '*'
            fzf --preview 'if [ -d {} ]; then tree -C {} || echo "No preview for directory"; else bat --style=plain --color=always {} || echo "No preview for file"; fi' $argv
    end
end

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.

function _fzf_compgen_path
    fd --hidden --follow --exclude ".git" . $argv[1]
end

# Use fd to generate the list for directory completion

function _fzf_compgen_dir
    fd --type d --hidden --follow --exclude ".git" . $argv[1]
end
