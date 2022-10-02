local status_ok, wezterm = pcall(require, "wezterm")
if not status_ok then
  return {}
end

return {
  audible_bell = "Disabled",
  font = wezterm.font_with_fallback({
    'Liga SFMono Nerd Font',
    'JetBrainsMono Nerd Font Mono',
    'BlexMono Nerd Font Mono',
  }),
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  window_background_opacity = 0.95,
}
