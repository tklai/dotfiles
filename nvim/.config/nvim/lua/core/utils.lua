local M = {}

M.set_highlights = function(color_group)
  for group_name, group_settings in pairs(color_group) do
    local def = {
      bg = group_settings.bg or "NONE",
      fg = group_settings.fg or "NONE",
    }

    vim.api.nvim_set_hl(0, group_name, def)
  end
end

return M
