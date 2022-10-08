local neogit = vim.F.npcall(require, 'neogit')
if not neogit then
  return
end

local Keymap = require("tk.utils.keymap")
local nnoremap = Keymap.nnoremap

neogit.setup({})

nnoremap('<leader>vc', neogit.open)
