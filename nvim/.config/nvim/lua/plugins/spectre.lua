local Keymap = require("tk.utils.keymap")
local nnoremap = Keymap.nnoremap
local vnoremap = Keymap.vnoremap

local spectre = require("spectre")

spectre.setup({})

nnoremap("<leader>S", spectre.open, { desc = "Find & Replace Globally" })
nnoremap("<leader>sw", function() spectre.open_visual({select_word = true}) end, { desc = "Display Find & Replace and search the word under the cursor" })
vnoremap("<leader>sv", spectre.open_visual, { desc = "Find & Replace the text which selected in VISUAL" })
