local M = {}

M.get_default_opts = function()
  return {
    noremap = true,
    -- silent = true,
  }
end

-- Thank you, ThePrimeagen
M.bind = function(mode, default_opts)
  default_opts = default_opts or M.get_default_opts()

  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force", default_opts, opts or {})

    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

return M
