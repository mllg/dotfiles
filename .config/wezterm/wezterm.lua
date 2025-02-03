local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Gruvbox Dark'
config.initial_rows = 50
config.initial_cols = 150
config.font_size = 12

if string.match(wezterm.hostname(), "ithaka") then
    config.font_size = 14
end

return config
