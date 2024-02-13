-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}


-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.front_end = "OpenGL"
--config.front_end = "Software"

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
--config.color_scheme = 'Hardcore'
--config.color_scheme = 'Catppuccin Mocha'
config.color_scheme =  'Dracula'
--config.font = wezterm.font 'GoMono Nerd Font Mono'
config.font = wezterm.font '3270 Nerd Font'
config.font = wezterm.font 'BigBlueTermPlus Nerd Font'
config.font_size=9.5

config.inactive_pane_hsb = {
 saturation = 0.8;
 brightness = 0.7;
}

-- keymapping
config.keys = {
    {
        key = "v",
        mods = "CTRL|SHIFT|ALT",
        action = wezterm.action.SplitVertical {domain = "CurrentPaneDomain"},
    },
    {
        key = "h",
        mods = "CTRL|SHIFT|ALT",
        action = wezterm.action.SplitHorizontal {domain = "CurrentPaneDomain"},
    },
    {
        key = "z",
        mods = "CTRL|SHIFT|ALT",
        action = wezterm.action.TogglePaneZoomState,
    },
    {
        key = "p",
        mods = "CTRL|SHIFT|ALT",
        action = wezterm.action.PaneSelect {
            alphabet = "1234567890",
        },
    },
    {
        key = "t",
        mods = "CTRL|SHIFT|ALT",
        action = wezterm.action.SpawnTab {
            DomainName = "unix",
        },
    },
}

config.window_background_opacity = 0.9
config.macos_window_background_blur = 20

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true



-- and finally, return the configuration to wezterm
return config

