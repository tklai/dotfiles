return {
  {
    "mbbill/undotree",
    config = function()
      vim.g.undotree_WindowLayout = 4
      vim.g.undotree_SplitWidth = 40

      vim.keymap.set("n", "<leader>ud", vim.cmd.UndotreeToggle)
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "UIEnter",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({})

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():append()
      end)
      vim.keymap.set("n", "<leader>q", function()
        harpoon:list():remove()
      end)
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

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
  {
    "stevearc/profile.nvim",
    init = function()
      vim.keymap.set("", "<f12>", function()
        local prof = require("profile")

        if prof.is_recording() then
          prof.stop()
          vim.ui.input(
            { prompt = "Save profile to:", completion = "file", default = "profile.json" },
            function(filename)
              if filename then
                prof.export(filename)

                vim.notify(string.format("Wrote %s", filename))
              end
            end
          )
        else
          prof.start("*")
        end
      end)
    end,
  },
}
