-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action
-- This is where you actually apply your config choices

config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color" -- Set the terminal type

-- 设置字体
-- config.font = wezterm.font('Source Code Pro')
config.font = wezterm.font('Hack Nerd Font')
config.cell_width = 0.9
config.window_background_opacity = 0.8
config.prefer_egl = true

-- For example, changing the color scheme:
-- config.color_scheme = 'Batman'

-- config.inactive_pane_hsb = {
-- 	saturation = 0.0,
-- 	brightness = 1.0,
-- }

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- tabs
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- color scheme toggling
wezterm.on("toggle-colorscheme", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if overrides.color_scheme == "Zenburn" then
		overrides.color_scheme = "Cloud (terminal.sexy)"
	else
		overrides.color_scheme = "Zenburn"
	end
	window:set_config_overrides(overrides)
end)



config.color_scheme = "Cloud (terminal.sexy)"
config.colors = {
	-- background = '#3b224c',
	-- background = "#181616", -- vague.nvim bg
	-- background = "#080808", -- almost black
	background = "#0c0b0f", -- dark purple
	-- background = "#020202", -- dark purple
	-- background = "#17151c", -- brighter purple
	-- background = "#16141a",
	-- background = "#0e0e12", -- bright washed lavendar
	-- background = 'rgba(59, 34, 76, 100%)',
	cursor_border = "#bea3c7",
	-- cursor_fg = "#281733",
	cursor_bg = "#bea3c7",
	-- selection_fg = '#281733',

	tab_bar = {
		background = "#0c0b0f",
		-- background = "rgba(0, 0, 0, 0%)",
		active_tab = {
			bg_color = "#0c0b0f",
			fg_color = "#bea3c7",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#0c0b0f",
			fg_color = "#f8f2f5",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},

		new_tab = {
			-- bg_color = "rgba(59, 34, 76, 50%)",
			bg_color = "#0c0b0f",
			fg_color = "white",
		},
	},
}
config.window_frame = {
	font = wezterm.font({ family = "Hack Nerd Font", weight = "Regular" }),
	active_titlebar_bg = "#0c0b0f",
	-- active_titlebar_bg = "#181616",
}
-- 右击粘贴
config.mouse_bindings = {
	{
		-- right clink select (not wezterm copy mode),copy, and if don't select anything, paste
		-- https://github.com/wez/wezterm/discussions/3541#discussioncomment-5633570
		event = { Down = { streak = 1, button = 'Right' } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act({
					PasteFrom = "Clipboard"
				}), pane)
			end
		end)
	},
	-- Change the default click behavior so that it only selects
	-- text and doesn't open hyperlinks
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'NONE',
		-- action = act.CompleteSelection('ClipboardAndPrimarySelection'),
		action = act.Nop
	},
	-- and make CTRL-Click open hyperlinks
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'CTRL',
		action = act.OpenLinkAtMouseCursor,
	},
}
-- 边框
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
-- config.window_decorations = "NONE | RESIZE"
-- 设置默认启动程序
config.default_prog = { 'powershell.exe' }

-- and finally, return the configuration to wezterm
return config