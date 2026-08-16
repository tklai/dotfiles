return {
  {
    "rebelot/kanagawa.nvim",
    enabled = false,
    config = function()
      local kanagawa = vim.F.npcall(require, "kanagawa")
      if not kanagawa then
        return
      end

      kanagawa.setup({
        transparent = true,
        dimInactive = true,
        overrides = function(colors)
          local theme = colors.theme
          local overrides = {}

          -- Telescope
          if vim.F.npcall(require, "telescope") then
            overrides = vim.tbl_extend("force", overrides, {
              TelescopeNormal = {
                bg = theme.ui.bg,
              },
              TelescopeSelection = {
                bg = theme.ui.bg,
              },
              TelescopeBorder = {
                fg = theme.ui.bg,
                bg = theme.ui.bg,
              },
              TelescopePromptBorder = {
                fg = theme.ui.bg,
                bg = theme.ui.bg,
              },
              TelescopePromptNormal = {
                fg = theme.ui.fg,
                bg = theme.ui.bg,
              },
              TelescopePromptPrefix = {
                fg = colors.palette.autumnRed,
                bg = theme.ui.bg,
              },
              TelescopePromptTitle = {
                fg = theme.ui.float.bg,
                bg = theme.syn.number,
              },
              TelescopePreviewTitle = {
                fg = theme.ui.float.bg,
                bg = theme.diag.ok,
              },
              TelescopePreviewNormal = {
                fg = theme.ui.fg,
                bg = theme.ui.bg_m1,
              },
              TelescopePreviewBorder = {
                fg = theme.ui.bg_m1,
                bg = theme.ui.bg_m1,
              },
              TelescopeResultsTitle = {
                fg = theme.ui.float.bg,
                bg = theme.syn.fun,
              },
              TelescopeResultsNormal = {
                fg = theme.ui.fg,
                bg = theme.ui.bg_m2,
              },
              TelescopeResultsBorder = {
                fg = theme.ui.bg_m2,
                bg = theme.ui.bg_m2,
              },
            })
          end

          -- Illuminate
          if vim.F.npcall(require, "Illuminate") then
            overrides = vim.tbl_extend("force", overrides, {
              IlluminatedWordText = {
                bg = theme.ui.bg_m2,
              },
              IlluminatedWordRead = {
                bg = theme.ui.bg_m2,
              },
              IlluminatedWordWrite = {
                bg = theme.ui.bg_m2,
              },
            })
          end

          return overrides
        end,
        background = {
          dark = "wave",
          light = "lotus",
        },
      })

      vim.cmd.colorscheme("kanagawa")
    end,
  },
}
