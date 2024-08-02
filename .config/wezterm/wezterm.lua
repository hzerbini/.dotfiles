local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("JetBrains Mono")
config.font_size = 11.0
config.color_scheme = "nord"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.default_prog = { "/bin/zsh", "-l", "-c", "tmux attach -t default || tmux new -s default" }

return config
