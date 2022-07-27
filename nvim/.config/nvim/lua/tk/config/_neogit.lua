local has_neogit, neogit = pcall(require, 'neogit')
if not has_neogit then
  return
end

local Keymap = require("tk.utils.keymap")
local nnoremap = Keymap.nnoremap

neogit.setup({})

nnoremap('<leader>vc', function() neogit.open() end)
