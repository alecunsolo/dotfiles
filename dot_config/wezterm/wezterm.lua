local wezterm = require('wezterm')

local config = {}

-- Fonts
config.font = wezterm.font_with_fallback({
    {
        family = "FiraCode Nerd Font",
        harfbuzz_features = {
            "zero", -- 0
            "ss05", -- @
            "ss03", -- &
        }
    },
    "JetBrains Mono",
})
config.font_size = 10.5

config.color_scheme = 'Tokyo Night'
config.enable_tab_bar = false

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false

return config
