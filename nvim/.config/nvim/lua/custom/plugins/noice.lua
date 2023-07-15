return {
  {
    "folke/noice.nvim",
    enabled = false,
    event = "UIEnter",
    init = function()
      vim.opt.cmdheight = 0
    end,
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          background_colour = "#E1E2E6",
          -- stages = "fade",
          stages = {
            function(state)
              local next_height = state.message.height + 2
              local next_row =
                require("notify.stages.util").available_slot(state.open_windows, next_height, "bottom_up")
              if not next_row then
                return nil
              end
              return {
                relative = "editor",
                anchor = "SE",
                width = state.message.width,
                height = state.message.height,
                col = vim.opt.columns:get(),
                row = next_row,
                border = "rounded",
                style = "minimal",
                opacity = 0,
              }
            end,
            function()
              return {
                opacity = { 100 },
                col = { vim.opt.columns:get() },
              }
            end,
            function()
              return {
                col = { vim.opt.columns:get() },
                time = true,
              }
            end,
            function()
              return {
                opacity = {
                  0,
                  frequency = 2,
                  complete = function(cur_opacity)
                    return cur_opacity <= 4
                  end,
                },
                col = { vim.opt.columns:get() },
              }
            end,
          },
        },
        keys = {
          {
            "<leader>un",
            function()
              require("notify").dismiss({ silent = true, pending = true })
            end,
            desc = "Delete all Notifications",
          },
        },
      },
    },
  },
}
