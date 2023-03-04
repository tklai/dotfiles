local kanagawa = vim.F.npcall(require, "kanagawa")
if not kanagawa then
  return
end

local default_colors = require("kanagawa.colors").setup()

local overrides = {}

-- Telescope
if vim.F.npcall(require, "telescope") then
  overrides = vim.tbl_extend("force", overrides, {
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
  })
end

-- Illuminate
if vim.F.npcall(require, "Illuminate") then
  overrides = vim.tbl_extend("force", overrides, {
    IlluminatedWordText = {
      bg = default_colors.sumiInk4,
    },
    IlluminatedWordRead = {
      bg = default_colors.sumiInk4,
    },
    IlluminatedWordWrite = {
      bg = default_colors.sumiInk4,
    },
  })
end

kanagawa.setup({
  dimInactive = false,
  globalStatus = true,
  overrides = overrides,
  -- transparent = true,
})

vim.cmd.colorscheme("kanagawa")
