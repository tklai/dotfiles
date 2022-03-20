local present, kanagawa = pcall(require, "kanagawa")
if not present then
  return
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

kanagawa.setup({
    dimInactive = true,
    globalStatus = true,
})

local setColorScheme = function ()
    vim.cmd("colorscheme kanagawa")

    local default_colors = require("kanagawa.colors").setup()

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

      set_highlights(telescope_colors)
    end

    local has_modes, modes = pcall(require, "modes")
    if has_modes then
      vim.opt.cursorline = true
      modes.setup({
        colors = {
          copy = default_colors.boatYellow1,
          delete = default_colors.waveRed,
          insert = default_colors.carpYellow,
          visual = default_colors.lightBlue,
        },
        line_opacity = 0.25,
      })
    end
end

vim.api.nvim_create_augroup("SetColorscheme", {})
vim.api.nvim_create_autocmd("VimEnter", {
    group = "SetColorscheme",
    desc = "Set colorscheme after loading all plugins",
    pattern = "*",
    callback = setColorScheme,
})

