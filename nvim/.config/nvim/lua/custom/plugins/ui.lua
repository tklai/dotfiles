return {
  -- {
  --   "folke/zen-mode.nvim",
  --   cmd = "ZenMode",
  --   opts = {
  --     window = {
  --       width = 0.7,
  --     },
  --     plugins = {
  --       gitsigns = true,
  --       tmux = true,
  --     },
  --   },
  --   init = function()
  --     vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Zen Mode" })
  --   end,
  -- },
  {
    "Pocco81/true-zen.nvim",
    event = "VeryLazy",
    init = function ()
      vim.keymap.set("n", "<leader>za", ":TZAtaraxis<CR>", { desc = "True Zen Ataraxis" })
      vim.keymap.set("n", "<leader>zn", ":TZNarrow<CR>", { desc = "True Zen Smart Narrow" })
      vim.keymap.set("v", "<leader>zn", ":'<,'>TZNarrow<CR>", { desc = "True Zen Selected Narrow" })
    end,
    opts = {
      modes = {
        ataraxis = {
          minimum_writing_area = {
            width = 120,
            height = 50,
          },
          quit_untoggles = true,
          padding = {
            left = 100,
            right = 100,
          },
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = " File Explorer",
            text_align = "left",
          },
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "UIEnter",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    opts = {
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = {
          "branch",
          "diff",
          "diagnostics",
        },
        lualine_c = {
          { "filename", path = 1 },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = {},
        lualine_z = { "location", "progress" },
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    event = "VimEnter",
    init = function()
      vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
      vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFile<CR>", { desc = "Navigate to file entry in NvimTree" })
    end,
    opts = {
      update_cwd = true,
      view = {
        width = "20%",
        side = "right",
        -- float = {
        --   enable = true,
        --   open_win_config = function()
        --     local function size(max, value)
        --       return value > 1 and math.min(value, max) or math.floor(max * value)
        --     end
        --
        --     return {
        --       relative = "editor",
        --       border = "rounded",
        --       width = size(vim.o.columns, 0.2),
        --       height = size(vim.o.lines, 0.8),
        --       row = 1,
        --       col = 1,
        --     }
        --   end,
        -- },
      },
    },
  },
  {
    "mcauley-penney/visual-whitespace.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  {
    "rmagatti/goto-preview",
    event = "BufEnter",
    config = true,
    init = function()
      vim.keymap.set("n", "<M-Space>", require("goto-preview").goto_preview_definition)
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
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
        -- command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },
  {
    "MunifTanjim/nui.nvim",
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
      stages = "fade",
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
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
  {
    "sethen/line-number-change-mode.nvim",
    event = "UIEnter",
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      chunk = {
        enable = true,
      },
    },
  },
}
