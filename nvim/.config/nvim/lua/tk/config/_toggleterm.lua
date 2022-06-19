local Keymap = require("tk.utils.keymap")

require("toggleterm").setup{}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  hidden = true,
})

function _lazygit_toggle()
  lazygit:toggle()
end

Keymap.nnoremap("<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { desc = "Toggle lazygit with ToggleTerm" })
