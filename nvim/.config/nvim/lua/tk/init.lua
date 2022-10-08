if vim.fn.has('nvim-0.8') == 0 then
  error("This configuration can only be run on neovim >=0.8.")
end

vim.F.npcall(require, "impatient")

if require("tk.initial_setup") then
  print("Initial Setup Completed. Please restart Neovim.")
  return
end

require("tk.disable_builtins")
require("tk.options")
require("tk.plugins")
require("tk.lsp")
require("tk.colorscheme")

vim.opt.guifont="Liga SFMono Nerd Font:h12"
