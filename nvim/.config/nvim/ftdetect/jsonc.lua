local group_id = vim.api.nvim_create_augroup("jsonc_filetype_detect", {})

local set_autocmd = function(pattern)
  vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = group_id,
    pattern = pattern,
    callback = function()
      vim.opt_local.filetype = "jsonc"
    end,
  })
end

set_autocmd("tsconfig.json")
