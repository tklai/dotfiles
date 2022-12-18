local term_group = vim.api.nvim_create_augroup("term_emu", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  group = term_group,
  desc = "Settings for terminal emulator",
  pattern = "term://*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false

    vim.opt_local.scrolloff = 0
  end,
})
