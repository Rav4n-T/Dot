set -x CARGO_HOME ~/.local/share/rust/cargo
set -x RUSTUP_HOME ~/.local/share/rust/rustup
set -x RUSTUP_DIST_SERVER https://rsproxy.cn
set -x RUSTUP_UPDATE_ROOT https://rsproxy.cn/rustup
set -x PATH ~/.local/share/rust/cargo/bin $PATH

alias cg="cargo"
#source "/home/rav4n/.local/share/rust/cargo/env.fish"
