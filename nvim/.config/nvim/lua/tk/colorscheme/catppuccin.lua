local catppuccin = vim.F.npcall(require, "catppuccin")
if not catppuccin then
  return
end

catppuccin.setup({
  transparent_background = true,
  highlight_overrides = {
    all = function(latte)
      local overrides = {
        --
      }

      if vim.F.npcall(require, "telescope") then
        overrides = vim.tbl_extend("force", overrides, {
          TelescopeNormal = {
            bg = latte.surface1,
          },
          TelescopeSelection = {
            fg = latte.mantle,
            bg = latte.subtext1,
          },
          TelescopeBorder = {
            fg = latte.surface1,
            bg = latte.surface1,
          },
          TelescopePromptBorder = {
            fg = latte.mantle,
            bg = latte.mantle,
          },
          TelescopePromptNormal = {
            fg = latte.subtext1,
            bg = latte.mantle,
          },
          TelescopePromptPrefix = {
            fg = latte.flamingo,
            bg = latte.mantle,
          },
          TelescopePromptTitle = {
            fg = latte.mantle,
            bg = latte.flamingo,
          },
          TelescopePreviewTitle = {
            fg = latte.mantle,
            bg = latte.green,
          },
          TelescopePreviewNormal = {
            fg = latte.text,
            bg = latte.crust,
          },
          TelescopePreviewBorder = {
            fg = latte.crust,
            bg = latte.crust,
          },
          TelescopeResultsTitle = {
            fg = latte.mantle,
            bg = latte.teal,
          },
          TelescopeResultsNormal = {
            fg = latte.text,
            bg = latte.base,
          },
          TelescopeResultsBorder = {
            fg = latte.base,
            bg = latte.base,
          },
        })
      end

      return overrides
    end,
  },
  integrations = {
    treesitter = true,
    telescope = true,
    bufferline = true,
    cmp = true,
  },
})

vim.o.background = "light"
vim.cmd.colorscheme("catppuccin")
