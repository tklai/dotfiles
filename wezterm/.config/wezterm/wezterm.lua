local ok, wezterm = pcall(require, "wezterm")
if not ok then
  print("This file can only be run by WezTerm.")

  os.exit()
end

local configs = {
  audible_bell = "Disabled",
  font = wezterm.font_with_fallback({
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
  }),
  harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  use_fancy_tab_bar = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  window_decorations = "RESIZE",
  -- hide_tab_bar_if_only_one_tab = true,

  -- window_background_opacity = 0.95,
}

-- Themes
-- Kanagawa
-- configs.force_reverse_video_cursor = true
-- configs.colors = {
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
-- configs.color_scheme = "Catppuccin Latte"

-- Flexoki
configs.color_scheme = 'flexoki-light'

return configs
