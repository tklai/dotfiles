local keymap = require("tk.utils").keymap

keymap("", "<Space>", "<Nop>", "Leader Key")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Escape
-- jj to escape
keymap("i", "jj", "<ESC>", "Exit current mode")
keymap("i", "<C-c>", "<ESC>", "Exit insert mode")

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", "Move cursor to the left window")
keymap("n", "<C-j>", "<C-w>j", "Move cursor to the lower window")
keymap("n", "<C-k>", "<C-w>k", "Move cursor to the upper window")
keymap("n", "<C-l>", "<C-w>l", "Move cursor to the right window")

-- Pane
keymap("n", "<A-->", ":resize -10<CR>", "Decrease the height of current pane")
keymap("n", "<A-=>", ":resize +10<CR>", "Increase the height of current pane")
keymap("n", "<A-_>", ":vertical resize -10<CR>", "Decrease the width of current pane")
keymap("n", "<A-+>", ":vertical resize +10<CR>", "Increase the width of current pane")

-- Allow gf to open non-existent files
keymap("n", "gf", ":edit <cfile><CR>", "Allow opening non-existent file")

-- Disable Macros
keymap("n", "q", "<Nop>", "Macros disabled")

-- Disable Ex-mode
keymap("n", "Q", "<Nop>", "Ex-mode disabled")

-- Buffer Switching
keymap("n", "<leader>[", ":bprevious<CR>", "Switch to previous buffer")
keymap("n", "<leader>]", ":bnext<CR>", "Switch to next buffer")

-- Line moving
keymap("v", "J", ":m '>+1<CR>gv=gv", "Move the selected block down")
keymap("v", "K", ":m '<-2<CR>gv=gv", "Move the selected block up")
keymap("n", "<A-j>", ":m .+1<CR>", "Move the current link down")
keymap("n", "<A-k>", ":m .-2<CR>", "Move the current link up")

-- Keep the search highlight centered
keymap("n", "n", "nzzzv", "Select next occurrence and centered on the screen")
keymap("n", "N", "Nzzzv", "Select previous occurrence and centered on the screen")

-- Reselect visual selection after indenting
keymap("v", "<", "<gv", "Decrease indentation level")
keymap("v", ">", ">gv", "Increase indentation level")

-- Terminal
keymap("t", "<ESC>", "<C-\\><C-n>", "Escape TERM mode using <Escape> key")
