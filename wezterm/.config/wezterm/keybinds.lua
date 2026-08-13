---@diagnostic disable: unused-local

local wezterm = require("wezterm")
local act = wezterm.action

local keybinds = {
	-- General keybinds
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },

	{ key = "-", mods = "ALT", action = act.DecreaseFontSize },
	{ key = "=", mods = "ALT", action = act.IncreaseFontSize },

	{ key = "F11", mods = "NONE", action = act.ToggleFullScreen },

	{
		key = "Z",
		mods = "CTRL|SHIFT",
		action = wezterm.action_callback(function(window, pane)
			local overrides = window:get_config_overrides() or {}
			overrides.window_background_opacity = overrides.window_background_opacity == 1 and 0.9 or 1
			window:set_config_overrides(overrides)
		end),
	},

	{ key = "Enter", mods = "ALT", action = act.SendKey({ key = "Escape" }) },
}

return keybinds
