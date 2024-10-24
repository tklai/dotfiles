return {
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- background = "hard",
      on_highlights = function(hl, palette)
        hl.TelescopeNormal = { fg = palette.none, bg = palette.bg5 }
        hl.TelescopeSelection = { fg = palette.fg, bg = palette.bg_visual }
        hl.TelescopeBorder = { fg = palette.bg5, bg = palette.bg5 }
        hl.TelescopePromptNormal = { fg = palette.fg, bg = palette.bg1 }
        hl.TelescopePromptBorder = { fg = palette.bg1, bg = palette.bg1 }
        hl.TelescopePromptTitle = { fg = palette.bg1, bg = palette.orange }
        hl.TelescopePromptNormal = { fg = palette.fg, bg = palette.bg1 }
        hl.TelescopePromptBorder = { fg = palette.bg1, bg = palette.bg1 }
        hl.TelescopePreviewTitle = { fg = palette.bg2, bg = palette.green }
        hl.TelescopePreviewNormal = { fg = palette.fg, bg = palette.bg2 }
        hl.TelescopePreviewBorder = { fg = palette.bg2, bg = palette.bg2 }
        hl.TelescopeResultsTitle = { fg = palette.bg3, bg = palette.grey0 }
        hl.TelescopeResultsNormal = { fg = palette.grey2, bg = palette.bg3 }
        hl.TelescopeResultsBorder = { fg = palette.bg3, bg = palette.bg3 }

        local line_number_change_mode = vim.F.npcall(require, "line-number-change-mode")
        if line_number_change_mode ~= nil then
          line_number_change_mode.setup({
            mode = {
              i = {
                bg = palette.statusline2,
                fg = palette.bg0,
                bold = true,
              },
              n = {
                bg = palette.statusline1,
                fg = palette.bg0,
                bold = true,
              },
              R = {
                bg = palette.orange,
                fg = palette.bg0,
                bold = true,
              },
              v = {
                bg = palette.statusline3,
                fg = palette.bg0,
                bold = true,
              },
              V = {
                bg = palette.statusline3,
                fg = palette.bg0,
                bold = true,
              },
            },
          })
        end
      end,
    },
    init = function()
      vim.o.background = "light"
    end,
    config = function(_, opts)
      require("everforest").setup(opts)

      vim.cmd.colorscheme("everforest")
    end,
  },
}
