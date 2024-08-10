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
      end,
    },
    config = function(_, opts)
      require("everforest").setup(opts)

      vim.cmd.colorscheme("everforest")
    end,
  },
}
