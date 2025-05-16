unbinds = [
    "<Ctrl-d>",
    "<Ctrl-u>",
    "<Ctrl-f>",
    "<Ctrl-w>",
    "<Ctrl-Shift-w>",
    "<Ctrl-Shift-t>",
    "wi",
    "wl",
]

for lhs in unbinds:
    config.unbind(lhs)

binds = {
    "<Ctrl-d>": "cmd-run-with-count 25 scroll down",
    "<Ctrl-u>": "cmd-run-with-count 25 scroll up",
    "<Space>fh": "hint all hover",
    "<Space>fy": "hint links yank",
    "<Space>fm": "hint links spawn mpv {hint-url}",
    "<F12>": "devtools bottom",
    "<Space>ts": "set tabs.width 10%",
    "<Space>th": "set tabs.width 0%",
}

for lhs, rhs in binds.items():
    config.bind(lhs, rhs)
