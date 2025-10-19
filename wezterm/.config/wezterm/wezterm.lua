local ok, wezterm = pcall(require, "wezterm")
if not ok then
  print("This file can only be run by WezTerm.")

  os.exit()
end

local config = wezterm.config_builder()

config.audible_bell = "Disabled"
config.font = wezterm.font_with_fallback({
  -- {
  --   family = "KodeMono Nerd Font",
  -- },
  {
    family = "DepartureMono Nerd Font",
  },
  {
    family = "CaskaydiaMono Nerd Font",
  },
  {
    family = "CommitMono Nerd Font",
    weight = "Bold",
  },
  {
    family = "MonaspiceNe Nerd Font",
    weight = "Bold",
  },
  {
    family = "JetBrainsMono Nerd Font",
    weight = "Bold",
  },
  {
    family = "Liga SFMono Nerd Font",
    weight = "DemiBold",
  },
  {
    family = "MesloLGS NF",
    weight = "DemiBold",
  },
  {
    family = "Heiti TC",
    weight = "DemiBold",
  },
})
config.use_fancy_tab_bar = false
config.tab_max_width = 64
config.show_new_tab_button_in_tab_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Themes
-- Kanagawa
-- config.force_reverse_video_cursor = true
-- config.colors = {
--   foreground = "#dcd7ba",
--   background = "#1f1f28",
--
--   cursor_bg = "#c8c093",
--   cursor_fg = "#c8c093",
--   cursor_border = "#c8c093",
--
--   selection_fg = "#c8c093",
--   selection_bg = "#2d4f67",
--
--   scrollbar_thumb = "#16161d",
--   split = "#16161d",
--
--   ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
--   brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
--   indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
-- }

-- Catppuccin
-- config.color_scheme = "Catppuccin Latte"

-- Flexoki
-- config.color_scheme = 'flexoki-light'

-- Everforst
-- config.color_scheme = "Everforest Light (Medium)"

-- Toast
-- config.color_scheme = "Toast"

-- Rose Pine Dawn
-- config.color_scheme = "rose-pine-dawn"

-- E-ink
config.color_scheme = "E-ink (Light)"

-- Zenwritten
config.color_scheme = "zenwritten_light"

return config
