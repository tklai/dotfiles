vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("term_emu", { clear = true }),
  desc = "Settings for terminal emulator",
  pattern = "term://*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false

    vim.opt_local.scrolloff = 0
  end,
})
