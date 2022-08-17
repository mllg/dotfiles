local wezterm = require 'wezterm'
local hostname = wezterm.hostname()
local font_size

if string.match(hostname, "MacBook") then
    font_size = 12
elseif string.match(hostname, "ithaka") then
    font_size = 14
else
    font_size = 12
end

return {
    color_scheme = 'Gruvbox Dark',
    font_size = font_size,
    initial_rows = 999,
    initial_cols = 999,
}
