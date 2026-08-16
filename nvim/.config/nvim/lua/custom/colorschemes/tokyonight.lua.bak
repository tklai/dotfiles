return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    config = function()
      local tokyonight = vim.F.npcall(require, "tokyonight")
      if not tokyonight then
        return
      end

      tokyonight.setup({
        -- transparent = true,
        dim_inactive = true,
        on_highlights = function(hl, color)
          if vim.F.npcall(require, "telescope") then
            hl.TelescopeNormal = {
              fg = color.fg_dark,
              bg = color.bg_dark,
            }
            hl.TelescopeSelection = {
              bg = color.bg_highlight,
            }
            hl.TelescopeBorder = {
              fg = color.bg,
              bg = color.bg,
            }
            hl.TelescopePromptBorder = {
              fg = color.bg_highlight,
              bg = color.bg_highlight,
            }
            hl.TelescopePromptTitle = {
              fg = color.bg,
              bg = color.purple,
            }
            hl.TelescopePromptNormal = {
              fg = color.fg,
              bg = color.bg_highlight,
            }
            hl.TelescopePromptPrefix = {
              fg = color.bg1,
              bg = color.bg4,
            }
            hl.TelescopePreviewBorder = {
              fg = color.bg,
              bg = color.bg,
            }
            hl.TelescopePreviewTitle = {
              fg = color.bg0,
              bg = color.green,
            }
            hl.TelescopePreviewNormal = {
              fg = color.fg,
              bg = color.bg,
            }
            hl.TelescopeResultsTitle = {
              fg = color.bg,
              bg = color.cyan,
            }
            hl.TelescopeResultsNormal = {
              fg = color.fg,
              bg = color.bg_dark,
            }
            hl.TelescopeResultsBorder = {
              fg = color.bg_dark,
              bg = color.bg_dark,
            }
          end
        end,
      })

      -- vim.o.background = background_mode
      vim.cmd.colorscheme("tokyonight-day")
    end,
  },
}
