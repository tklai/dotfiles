if vim.fn.has("nvim-0.9") == 0 then
  vim.notify("This configuration can only be run on neovim >=0.9.", vim.log.levels.ERROR)
end

vim.loader.enable()

require("core.disable_builtins")
require("tk.options")

local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  vim.notify("lazy.nvim was not existed or loaded", vim.log.levels.INFO)

  -- Remove the folder / file before cloning
  vim.fn.delete(lazy_path, "rf")

  vim.notify("Cloning lazy.nvim to " .. lazy_path .. "...", vim.log.levels.INFO)
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazy_path,
  })
end

vim.opt.runtimepath:prepend(lazy_path)

require("lazy").setup({
  spec = {
    { import = "custom.plugins" },
  },
  defaults = { lazy = true },
  performance = {
    cache = { enabled = true },
    debug = false,
  },
})

require("tk.keymaps")
require("tk.lsp")

vim.opt.guifont = "Liga SFMono Nerd Font:h12"
