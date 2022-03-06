local M = {}

M.keymap = function (mode, lhs, rhs, desc, opts)
    local default_opts = { noremap = true, silent = true }

    opts = vim.tbl_extend("force", default_opts, opts or {})
    opts.desc = desc or ("<No description set for keymap '" .. lhs .. "'>")

    vim.keymap.set(mode, lhs, rhs, opts)
end

return M
