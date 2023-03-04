if vim.fn.has('nvim-0.8') == 0 then
  error("This configuration can only be run on neovim >=0.8.")
end

vim.F.npcall(require, "impatient")

require("core.disable_builtins")
require("tk.options")

local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  print("lazy.nvim was not existed or loaded")

  -- Remove the folder / file before cloning
  vim.fn.delete(lazy_path, "rf")

  print(string.format("Cloning lazy.nvim to '%s'...", lazy_path))
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

require("lazy").setup("custom.plugins")

require("tk.keymaps")
require("tk.lsp")

vim.opt.guifont="Liga SFMono Nerd Font:h12"
