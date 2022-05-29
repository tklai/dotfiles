if vim.fn.has('nvim-0.7') == 0 then
  error("This configuration can only be run on neovim >=0.7.")
end

pcall(require, "impatient")

if require("tk.initial_setup") then
  print("Initial Setup Completed. Please restart Neovim.")
  return
end

local modules = {
  "tk.disable_builtins",
  "tk.options",
  "tk.plugins",
  "tk.lsp",
  "tk.colorscheme",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error(string.format("Error on loading module '%s'.\nError:\n%s", module, err))
  end
end

vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
