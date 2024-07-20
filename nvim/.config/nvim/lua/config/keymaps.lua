local Keymap = require("utils.keymap")

local inoremap = Keymap.bind("i")
local nnoremap = Keymap.bind("n")
local vnoremap = Keymap.bind("v")
local tnoremap = Keymap.bind("t")
local xnoremap = Keymap.bind("x")

-- Escape
inoremap("<C-c>", "<ESC>", { desc = "Escape" })
inoremap("jj", "<ESC>", { desc = "Escape" })

-- No more highlight after search please
nnoremap("<ESC>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Disable highlight search on escape" })

-- Window navigation
nnoremap("<C-h>", "<C-w>h", { desc = "Move cursor to the left window" })
nnoremap("<C-j>", "<C-w>j", { desc = "Move cursor to the lower window" })
nnoremap("<C-k>", "<C-w>k", { desc = "Move cursor to the upper window" })
nnoremap("<C-l>", "<C-w>l", { desc = "Move cursor to the right window" })

-- Splits
-- nnoremap("ss", ":split<CR>", { desc = "Split window horizontally" })
-- nnoremap("sv", ":vsplit<CR>", { desc = "Split window vertically" })

-- H/L to start and end of line
nnoremap("H", "^", { desc = "Move cursor to the start of line" })
nnoremap("L", "$", { desc = "Move cursor to the end of line" })

-- Pane
nnoremap("<A-->", ":resize -10<CR>", { desc = "Decrease the height of current pane" })
nnoremap("<A-=>", ":resize +10<CR>", { desc = "Increase the height of current pane" })
nnoremap("<A-_>", ":vertical resize -10<CR>", { desc = "Decrease the width of current pane" })
nnoremap("<A-+>", ":vertical resize +10<CR>", { desc = "Increase the width of current pane" })

-- Always Centered
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-o>", "<C-o>zz")
nnoremap("<C-i>", "<C-i>zz")

-- Allow gf to open non-existent files
nnoremap("gf", ":edit <cfile><CR>", { desc = "Allow opening non-existent file" })

-- Disable Macros
nnoremap("q", "<Nop>", { desc = "Macros disabled" })

-- Disable Ex-mode
nnoremap("Q", "<Nop>", { desc = "Ex-mode disabled" })

-- Buffer Switching
nnoremap("[b", ":bprevious<CR>", { desc = "Switch to previous buffer" })
nnoremap("]b", ":bnext<CR>", { desc = "Switch to next buffer" })
nnoremap("\\b", ":bd<CR>", { desc = "Delete current buffer and show previous buffer" })
nnoremap("\\B", function()
  local nvimTreeView = vim.F.npcall(require, "nvim-tree.view")
  local isNvimTreeOpened = nvimTreeView and nvimTreeView.is_visible()
  local nvimTreeApi = vim.F.npcall(require, "nvim-tree.api")

  if vim.F.npcall(require, "bufferline") then
    vim.cmd("BufferLineCloseOthers")
  else
    if isNvimTreeOpened and nvimTreeApi then
      nvimTreeApi.tree.close()
    end

    -- TODO: To have a native implementation for closing other buffers
    vim.cmd("bufdo bd")

    if isNvimTreeOpened and nvimTreeApi then
      nvimTreeApi.tree.open()
    end
  end
end, { desc = "Delete all buffers" })

-- Line moving
vnoremap("J", ":m '>+1<CR>gv=gv", { desc = "Move the selected block down" })
vnoremap("K", ":m '<-2<CR>gv=gv", { desc = "Move the selected block up" })
nnoremap("<A-j>", ":m .+1<CR>", { desc = "Move the current link down" })
nnoremap("<A-k>", ":m .-2<CR>", { desc = "Move the current link up" })

-- Keep the search highlight centered
nnoremap("n", "nzzzv", { desc = "Select next occurrence and centered on the screen" })
nnoremap("N", "Nzzzv", { desc = "Select previous occurrence and centered on the screen" })

-- Reselect visual selection after indenting
vnoremap("<", "<gv", { desc = "Decrease indentation level" })
vnoremap(">", ">gv", { desc = "Increase indentation level" })

-- Terminal
tnoremap("<ESC>", "<C-\\><C-n>", { desc = "Escape TERM mode using <Escape> key" })

-- Call tmux-sessionizer without creating extra shell
nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { silent = true, desc = "Tmux sessionizer" })

xnoremap("<leader>d", [["_d]], { desc = "Delete without affecting the clipboard" })
xnoremap("<leader>p", [["_dP]], { desc = "Replace the selected line without losing the yank" })
nnoremap("[q", "<cmd>cprev<CR>zz", { desc = "Navigate files in quickfix list blazingly fast" })
nnoremap("]q", "<cmd>cnext<CR>zz", { desc = "Navigate files in quickfix list blazingly fast" })
nnoremap("qq", "<cmd>cclose<CR>", { desc = "Close quickfix list" })

nnoremap("<leader>x", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
  desc = "Find the word in current buffer and create replace regex in a real quick",
  silent = false,
})
nnoremap("<leader>X", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], {
  desc = "Find the word in current buffer and create replace regex without replacement in a real quick",
  silent = false,
})
xnoremap("<leader>x", [[:s//gI<Left><Left><Left>]], {
  desc = "Find the word in selected visual zone and create replace regex in a real quick",
  silent = false,
})
nnoremap("<leader>n", [[/<C-r><C-w><CR>]], {
  desc = "Find the word in current buffer and create replace regex in a real quick",
  silent = false,
})

nnoremap("<leader>d", vim.diagnostic.open_float, {
  desc = "Open diagnostic float",
  silent = true,
})
