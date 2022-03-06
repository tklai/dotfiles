local present, catppuccin = pcall(require, "catppuccin")
if not present then
  print("Where is my Catppuccin?")

  return false
end

local set_highlights = function(color_group)
  for group_name, group_settings in pairs(color_group) do
    local def = {
      bg = group_settings.bg or "NONE",
      fg = group_settings.fg or "NONE",
    }

    vim.api.nvim_set_hl(0, group_name, def)
  end
end

catppuccin.setup({
  transparent_background = true,
  integrations = {
    treesitter = true,
    telescope = true,
    bufferline = true,
    cmp = true,
  },
})

vim.cmd("colorscheme catppuccin")

local color_palette = require("catppuccin.core.color_palette")

if pcall(require, "telescope") then
  local telescope_colors = {
    TelescopeNormal = {
      bg = color_palette.black2,
    },
    TelescopeSelection = {
      bg = color_palette.black2,
    },
    TelescopeBorder = {
      fg = color_palette.black2,
      bg = color_palette.black2,
    },
    TelescopePromptBorder = {
      fg = color_palette.black3,
      bg = color_palette.black3,
    },
    TelescopePromptNormal = {
      fg = color_palette.white,
      bg = color_palette.black3,
    },
    TelescopePromptPrefix = {
      fg = color_palette.red,
      bg = color_palette.black3,
    },
    TelescopePromptTitle = {
      fg = color_palette.black1,
      bg = color_palette.flamingo,
    },
    TelescopePreviewTitle = {
      fg = color_palette.black1,
      bg = color_palette.green,
    },
    TelescopePreviewNormal = {
      fg = color_palette.white,
      bg = color_palette.black2,
    },
    TelescopePreviewBorder = {
      fg = color_palette.black2,
      bg = color_palette.black2,
    },
    TelescopeResultsTitle = {
      fg = color_palette.black0,
      bg = color_palette.teal,
    },
    TelescopeResultsNormal = {
      fg = color_palette.white,
      bg = color_palette.black1,
    },
    TelescopeResultsBorder = {
      fg = color_palette.black1,
      bg = color_palette.black1,
    },
  }

  set_highlights(telescope_colors)
end

local has_modes, modes = pcall(require, "modes")
if has_modes then
  vim.opt.cursorline = true
  modes.setup({
    colors = {
      copy = color_palette.maroon,
      delete = color_palette.pink,
      insert = color_palette.rosewater,
      visual = color_palette.sky,
    },
    line_opacity = 0.25,
  })
end
