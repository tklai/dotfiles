local opt = vim.opt

vim.g.did_load_filetypes = 1

opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.ignorecase = true
opt.laststatus = 3
opt.mouse = "a"
opt.number = true
opt.pumheight = 10
opt.relativenumber = true
-- We will use status line instead.
opt.scrolloff = 8
opt.showmode = false
opt.showtabline = 2
opt.sidescrolloff = 8
opt.signcolumn = "yes:2"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
opt.timeoutlen = 1000
opt.undofile = true
opt.updatetime = 300
opt.wrap = false
opt.writebackup = false
-- Indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4

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
