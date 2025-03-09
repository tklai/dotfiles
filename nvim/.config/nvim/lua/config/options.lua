vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.autoread = true
opt.autoindent = true
vim.schedule(function ()
  opt.clipboard = "unnamedplus"
end)
opt.cursorline = true
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = "split"
opt.laststatus = 3
opt.mouse = "a"
opt.pumheight = 10
-- opt.number = true
-- opt.relativenumber = true
-- We will use status line instead.
opt.scrolloff = 4
opt.showtabline = 2
opt.sidescrolloff = 4
opt.signcolumn = "yes:2"
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = vim.g.vscode and 1000 or 300
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
opt.colorcolumn = "80,120"
-- Fold
opt.foldlevel = 99
if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
  opt.foldexpr = "v:lua.require'utils.fold'.foldexpr()"
  opt.foldmethod = "expr"
  opt.foldtext = ""
else
  opt.foldmethod = "indent"
  opt.foldtext = "v:lua.require'utils.fold'.foldtext()"
end

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
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
})

opt.list = true
opt.listchars:append({
  trail = "×",
  tab = ">-",
  extends = ">",
  precedes = "<",
  nbsp = "+",
  -- Use whitespace plugin instead
  -- space = "·",
  -- leadmultispace = "·",
})

if vim.fn.executable("rg") == 1 then
  vim.o.grepprg = "rg --vimgrep --hidden --smart-case"
end
