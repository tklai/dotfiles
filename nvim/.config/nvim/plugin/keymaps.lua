local Keymap = require("tk.utils.keymap")

local inoremap = Keymap.inoremap
local nnoremap = Keymap.nnoremap
local vnoremap = Keymap.vnoremap
local tnoremap = Keymap.tnoremap

nnoremap("<Space>", "<Nop>", { desc = "Leader Key" })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Escape
-- jj to escape
inoremap("jj", "<ESC>", { desc = "Escape" })
inoremap("<C-c>", "<ESC>", { desc = "Escape" })

-- Window navigation
nnoremap("<C-h>", "<C-w>h", { desc = "Move cursor to the left window" })
nnoremap("<C-j>", "<C-w>j", { desc = "Move cursor to the lower window"})
nnoremap("<C-k>", "<C-w>k", { desc = "Move cursor to the upper window"})
nnoremap("<C-l>", "<C-w>l", { desc = "Move cursor to the right window"})

-- Pane
nnoremap("<A-->", ":resize -10<CR>", { desc = "Decrease the height of current pane" })
nnoremap("<A-=>", ":resize +10<CR>", { desc = "Increase the height of current pane" })
nnoremap("<A-_>", ":vertical resize -10<CR>", { desc = "Decrease the width of current pane" })
nnoremap("<A-+>", ":vertical resize +10<CR>", { desc = "Increase the width of current pane" })

-- Centered
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- Allow gf to open non-existent files
nnoremap("gf", ":edit <cfile><CR>", { desc = "Allow opening non-existent file" })

-- Disable Macros
nnoremap("q", "<Nop>", { desc = "Macros disabled" })

-- Disable Ex-mode
nnoremap("Q", "<Nop>", { desc = "Ex-mode disabled" })

-- Buffer Switching
nnoremap("[b", ":bprevious<CR>", { desc = "Switch to previous buffer" })
nnoremap("]b", ":bnext<CR>", { desc = "Switch to next buffer" })

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
nnoremap("<ESC>", "<ESC>:noh<CR>", { desc = "Disable highlight search on escape"})
