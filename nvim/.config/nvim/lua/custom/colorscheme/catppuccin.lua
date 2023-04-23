local catppuccin = vim.F.npcall(require, "catppuccin")
if not catppuccin then
  return
end

catppuccin.setup({
  -- transparent_background = true,
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.15,
  },
  color_overrides = {
    latte = {
      -- base = "#E1E2E6",
    },
  },
  highlight_overrides = {
    all = function(color)
      local overrides = {
        --
      }

      if vim.F.npcall(require, "telescope") then
        overrides = vim.tbl_extend("force", overrides, {
          TelescopeNormal = {
            bg = color.surface1,
          },
          TelescopeSelection = {
            fg = color.subtext0,
            bg = color.surface0,
          },
          TelescopeBorder = {
            fg = color.surface1,
            bg = color.surface1,
          },
          TelescopePromptBorder = {
            fg = color.mantle,
            bg = color.mantle,
          },
          TelescopePromptNormal = {
            fg = color.subtext1,
            bg = color.mantle,
          },
          TelescopePromptPrefix = {
            fg = color.flamingo,
            bg = color.mantle,
          },
          TelescopePromptTitle = {
            fg = color.mantle,
            bg = color.flamingo,
          },
          TelescopePreviewTitle = {
            fg = color.mantle,
            bg = color.green,
          },
          TelescopePreviewNormal = {
            fg = color.text,
            bg = color.crust,
          },
          TelescopePreviewBorder = {
            fg = color.crust,
            bg = color.crust,
          },
          TelescopeResultsTitle = {
            fg = color.mantle,
            bg = color.teal,
          },
          TelescopeResultsNormal = {
            fg = color.text,
            bg = color.base,
          },
          TelescopeResultsBorder = {
            fg = color.base,
            bg = color.base,
          },
        })
      end

      return overrides
    end,
  },
  integrations = {
    treesitter = true,
    telescope = true,
    cmp = true,
    noice = true,
    neogit = true,
  },
})

vim.cmd.colorscheme("catppuccin-latte")
