if vim.fn.has("nvim-0.9") == 0 then
  vim.notify("This configuration can only be run on neovim >=0.9.", vim.log.levels.ERROR)
end

vim.loader.enable()

require("config")
