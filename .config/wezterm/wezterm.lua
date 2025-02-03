local wezterm = require 'wezterm'
local hostname = wezterm.hostname()
local config = wezterm.config_builder()

config.color_scheme = 'Gruvbox Dark'
config.initial_rows = 50
config.initial_cols = 150

if string.match(hostname, "MacBook") then
    config.font_size = 12
elseif string.match(hostname, "ithaka") then
    config.font_size = 14
else
    config.font_size = 12
end

return config
