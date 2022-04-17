local keymap = require("tk.utils").keymap
local spectre = require("spectre")

spectre.setup({})

keymap("n", "<leader>S", spectre.open, "Find & Replace Globally")
keymap("n", "<leader>sw", function() spectre.open_visual({select_word = true}) end, "Display Find & Replace and search the word under the cursor")
keymap("v", "<leader>sv", spectre.open_visual, "Find & Replace the text which selected in VISUAL")

