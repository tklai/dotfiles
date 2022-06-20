local opt = vim.opt

opt.autoread = true
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = "split"
opt.laststatus = 3
opt.mouse = "n"
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
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 1000
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("XDG_DATA_HOME") .. "/nvim/undodir"
opt.undofile = true
opt.updatetime = 300
opt.wrap = false
-- Indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.colorcolumn = "80"
-- Fold
opt.foldmethod = "markers"

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
