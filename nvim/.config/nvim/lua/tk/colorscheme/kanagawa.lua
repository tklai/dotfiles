local present, kanagawa = pcall(require, "kanagawa")
if not present then
  return
end

kanagawa.setup({
  dimInactive = true,
  globalStatus = true,
})

vim.cmd("colorscheme kanagawa")

local default_colors = require("kanagawa.colors").setup()
local setHl = require("tk.utils").set_highlights

if pcall(require, "telescope") then
  local telescope_colors = {
    TelescopeNormal = {
      bg = default_colors.sumiInk2,
    },
    TelescopeSelection = {
      bg = default_colors.sumiInk2,
    },
    TelescopeBorder = {
      fg = default_colors.sumiInk2,
      bg = default_colors.sumiInk2,
    },
    TelescopePromptBorder = {
      fg = default_colors.sumiInk3,
      bg = default_colors.sumiInk3,
    },
    TelescopePromptNormal = {
      fg = default_colors.fujiWhite,
      bg = default_colors.sumiInk3,
    },
    TelescopePromptPrefix = {
      fg = default_colors.autumnRed,
      bg = default_colors.sumiInk3,
    },
    TelescopePromptTitle = {
      fg = default_colors.sumiInk1,
      bg = default_colors.sakuraPink,
    },
    TelescopePreviewTitle = {
      fg = default_colors.sumiInk1,
      bg = default_colors.springGreen,
    },
    TelescopePreviewNormal = {
      fg = default_colors.fujiWhite,
      bg = default_colors.sumiInk2,
    },
    TelescopePreviewBorder = {
      fg = default_colors.sumiInk2,
      bg = default_colors.sumiInk2,
    },
    TelescopeResultsTitle = {
      fg = default_colors.sumiInk0,
      bg = default_colors.waveAqua2,
    },
    TelescopeResultsNormal = {
      fg = default_colors.fujiWhite,
      bg = default_colors.sumiInk1,
    },
    TelescopeResultsBorder = {
      fg = default_colors.sumiInk1,
      bg = default_colors.sumiInk1,
    },
  }

  setHl(telescope_colors)
end
