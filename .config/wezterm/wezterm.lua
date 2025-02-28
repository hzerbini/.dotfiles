local wezterm = require("wezterm")
local keys = require("./keys")
local config = {}

config.font = wezterm.font("JetBrains Mono")
config.font_size = 9.0
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

-- Configure Keys
config.disable_default_key_bindings = true
config.use_ime = true
config.keys = keys

return config
