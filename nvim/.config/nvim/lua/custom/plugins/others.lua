return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "UIEnter",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local harpoon = require('harpoon')
      harpoon:setup({})

      vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
      vim.keymap.set("n", "<leader>q", function() harpoon:list():remove() end)
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      harpoon:extend({
        UI_CREATE = function(cx)
          vim.keymap.set("n", "<C-v>", function()
            harpoon.ui:select_menu_item({ vsplit = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-x>", function()
            harpoon.ui:select_menu_item({ split = true })
          end, { buffer = cx.bufnr })
        end,
      })
    end,
  },
}
