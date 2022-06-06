vim.api.nvim_create_augroup("term_emu", {})
vim.api.nvim_create_autocmd("TermOpen", {
    group = "term_emu",
    desc = "Settings for terminal emulator",
    pattern = "term://*",
    callback = function ()
        vim.opt_local.filetype = "term"
    end,
})
