local present, spectre = pcall(require, 'spectre')
if not present then
  return
end

local keymap = require("tk/utils").keymap

spectre.setup({})

keymap("n", "<leader>S", spectre.open, "Find & Replace Globally", {noremap = true, silent = true})
keymap("n", "<leader>sw", function() spectre.open_visual({select_word = true}) end, "Display Find & Replace and search the word under the cursor", {noremap = true, silent = true})
keymap("v", "<leader>sv", spectre.open_visual, "Find & Replace the text which selected in VISUAL", {noremap = true, silent = true})

