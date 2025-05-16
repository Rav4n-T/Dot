config.load_autoconfig(False)
config.source("keymaps.py")
config.source("themes.py")


c.scrolling.bar = "never"
c.scrolling.smooth = True

c.fonts.default_size = "12pt"

c.content.headers.accept_language = "zh_CN;q=0.9,en_US,en;q=0.8"
c.content.headers.user_agent = "5.0 (Windows NT 10.0; WOW64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.5666.197 Safari/537.36"

c.tabs.title.format = "{audio} {index}: {current_title}"
c.tabs.position = "left"
c.tabs.width = "0%"
c.tabs.last_close = "default-page"

c.hints.padding = {"bottom": 1, "left": 5, "right": 3, "top": 1}
c.hints.border = "none"
c.hints.chars = "qwertyuiopasdfghjklzxcvbnm"

c.statusbar.show = "in-mode"
c.statusbar.padding = {"bottom": 2, "left": 0, "right": 5, "top": 2}
c.statusbar.widgets = ["search_match", "text:|", "url", "text:|", "scroll"]

c.tabs.padding = {"bottom": 5, "left": 10, "right": 10, "top": 5}

c.url.default_page = "https://start.duckduckgo.com/"
c.url.start_pages = "https://start.duckduckgo.com/"
c.url.searchengines = {"DEFAULT": "https://duckduckgo.com/?&q={}"}
