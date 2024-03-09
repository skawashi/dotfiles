-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local format = require("format")

-- This table will hold the configuration.
local config = {
	-- initial_cols = 100,
	-- initial_rows = 40,
	window_padding = {
		left = 10,
		right = 0,
		top = 20,
		bottom = 0,
	},

	line_height = 1.1,
	cell_width = 1.0,
	font_size = 15.0,
	font = wezterm.font_with_fallback({
		{ family = "Fira Code", weight = "Regular" },
		-- { family = "FiraCode Nerd Font Mono", weight = "Regular" }, -- wezterm にはNerd Fontが内蔵されているので不要
		{ family = "MesloLGS NF", weight = "Regular" },
	}),
	underline_position = -8,
	underline_thickness = 3,
	set_environment_variables = {
		TERMINFO_DIRS = "~/.config/terminfo",
		WSLENV = "TERMINFO_DIRS",
	},
	term = "wezterm",

	color_scheme = "Solarized Dark (Gogh)",
	force_reverse_video_cursor = true,

	-- default_cursor_style = "BlinkingBlock",
	-- cursor_blink_rate = 350,

	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.95,
	text_background_opacity = 0.95,

	-- window_background_image = '/Users/shun_ts/.config/wezterm/image/wallpaperbetter.com_3840x2160.jpg',
	window_background_image_hsb = {
		brightness = 0.2,
		hue = 1.0,
		saturation = 1.0,
	},

	use_ime = true,
	-- ime_preedit_rendering = 'System',
	macos_forward_to_ime_modifier_mask = "CTRL",



	-- import key binds config file
	leader = { key = "g", mods = "CTRL", timeout_milliseconds = 5000 },
	disable_default_key_bindings = true,
	keys = require("keybinds").keys,
	key_tables = require("keybinds").key_tables,
}

-- format で定義したconfig を追加
for k, v in pairs(format) do
	config[k] = v
end

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
-- if wezterm.config_builder then
--   config = wezterm.config_builder()
-- end

return config
