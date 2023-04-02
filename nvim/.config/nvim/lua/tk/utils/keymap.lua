local M = {}

M.get_default_opts = function()
  return {
    noremap = true,
    -- silent = true,
  }
end

-- Thank you, ThePrimeagen
local function bind(mode, default_opts)
  default_opts = default_opts or M.get_default_opts()

  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force", default_opts, opts or {})

    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

M.inoremap = bind("i")
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.tnoremap = bind("t")
M.xnoremap = bind("x")

return M
