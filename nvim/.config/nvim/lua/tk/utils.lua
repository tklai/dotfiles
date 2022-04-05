local M = {}

M.keymap = function (mode, lhs, rhs, desc, opts)
    local default_opts = { noremap = true, silent = true }

    opts = vim.tbl_extend("force", default_opts, opts or {})
    opts.desc = desc or ("<No description set for keymap '" .. lhs .. "'>")

    vim.keymap.set(mode, lhs, rhs, opts)
end

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
