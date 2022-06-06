local keymap = require("tk.utils").keymap

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

keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", "Toggle lazygit with ToggleTerm")