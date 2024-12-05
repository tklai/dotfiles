return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        width = 0.7,
      },
      plugins = {
        gitsigns = true,
        tmux = true,
      },
    },
    init = function()
      vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Zen Mode" })
    end,
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
}
