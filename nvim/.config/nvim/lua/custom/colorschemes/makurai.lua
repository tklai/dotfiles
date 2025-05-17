return {
  {
    "Skardyy/makurai-nvim",
    -- enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "light"

      require("makurai").setup({
        transparent = false,
      })

      local line_number_change_mode = vim.F.npcall(require, "line-number-change-mode")
      if line_number_change_mode ~= nil then
        local palette = require("makurai.palettes.healer").get()

        line_number_change_mode.setup({
          mode = {
            i = {
              bg = palette.green,
              fg = palette.cursor,
              bold = true,
            },
            n = {
              bg = palette.blue,
              fg = palette.cursor,
              bold = true,
            },
            R = {
              bg = palette.error,
              fg = palette.cursor,
              bold = true,
            },
            v = {
              bg = palette.purple,
              fg = palette.cursor,
              bold = true,
            },
            V = {
              bg = palette.purple,
              fg = palette.cursor,
              bold = true,
            },
          },
        })
      end

      vim.cmd.colorscheme("makurai_healer")
    end,
  },
}
