vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.autoread = true
opt.autoindent = true
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.ignorecase = true
-- opt.inccommand = "split"
opt.laststatus = 3
opt.mouse = "a"
opt.number = true
opt.pumheight = 10
opt.relativenumber = true
-- We will use status line instead.
opt.scrolloff = 4
opt.showmode = false
opt.showtabline = 2
opt.sidescrolloff = 4
opt.signcolumn = "yes:2"
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 1000
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.stdpath("data") .. "/undodir"
opt.undofile = true
opt.updatetime = 300
opt.wrap = false
-- Indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.shiftround = true
opt.colorcolumn = "80"
-- Fold
-- opt.foldmethod = "marker"
opt.foldcolumn = "1"
opt.foldlevel = 20
opt.foldenable = true

opt.belloff = "all"

opt.shortmess:append("I")

opt.fillchars:append({
  horiz = "═",
  horizup = "╩",
  horizdown = "╦",
  vert = "║",
  vertleft = "╣",
  vertright = "╠",
  verthoriz = "╬",
})

opt.list = true
opt.listchars:append({
  -- space = "·",
  trail = "×",
  -- leadmultispace = "·",
  tab = ">-",
  extends = ">",
  precedes = "<",
  nbsp = "+",
})
