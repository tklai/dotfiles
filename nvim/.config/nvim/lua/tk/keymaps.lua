local Keymap = require("tk.utils.keymap")

local inoremap = Keymap.inoremap
local nnoremap = Keymap.nnoremap
local vnoremap = Keymap.vnoremap
local tnoremap = Keymap.tnoremap
local xnoremap = Keymap.xnoremap

nnoremap("<Space>", "<Nop>", { desc = "Occupied by leader Key" })

-- Escape
inoremap("<C-c>", "<ESC>", { desc = "Escape" })

-- Save file
nnoremap("<leader>w", ":w<CR>", { desc = "Save current buffer" })

-- Window navigation
nnoremap("<C-h>", "<C-w>h", { desc = "Move cursor to the left window" })
nnoremap("<C-j>", "<C-w>j", { desc = "Move cursor to the lower window" })
nnoremap("<C-k>", "<C-w>k", { desc = "Move cursor to the upper window" })
nnoremap("<C-l>", "<C-w>l", { desc = "Move cursor to the right window" })

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
nnoremap("\\b", ":bd | bp<CR>", { desc = "Delete current buffer and show previous buffer" })

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

-- No more highlight after search please
nnoremap("<ESC>", "<ESC>:noh<CR>", { silent = true, desc = "Disable highlight search on escape" })

-- Call tmux-sessionizer without creating extra shell
nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { silent = true, desc = "Tmux sessionizer" })

xnoremap("<leader>d", [["_d]], { desc = "Delete without affecting the clipboard" })
xnoremap("<leader>p", [["_dP]], { desc = "Replace the selected line without losing the yank" })
nnoremap("<leader>cj", "<cmd>cnext<CR>zz", { desc = "Navigate files in quickfix list blazingly fast" })
nnoremap("<leader>ck", "<cmd>cprev<CR>zz", { desc = "Navigate files in quickfix list blazingly fast" })
nnoremap("<leader>cq", "<cmd>cclose<CR>", { desc = "Close quickfix list" })

nnoremap(
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Find the word in current buffer and create replace regex in a real quick" }
)
xnoremap(
  "<leader>s",
  [[:s/\<\>//gI<Left><Left><Left><Left><Left><Left>]],
  { desc = "Find the word in selected visual zone and create replace regex in a real quick" }
)
nnoremap(
  "<leader>n",
  [[/<C-r><C-w><CR>]],
  { desc = "Find the word in current buffer and create replace regex in a real quick" }
)
