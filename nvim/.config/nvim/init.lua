if vim.fn.has("nvim-0.10") == 0 then
  vim.notify("This configuration can only be run on neovim >=0.10.", vim.log.levels.ERROR)
end

if vim.loader then
  vim.loader.enable()
end

require("config")
