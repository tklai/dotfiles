return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "UIEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
      { "nvim-tree/nvim-web-devicons" },
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
    keys = {
      { "<C-b>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
      { "<leader>tf", "<cmd>NvimTreeFindFile<CR>", desc = "Navigate to file entry in NvimTree" },
    },
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
    keys = {
      {
        "<M-Space>",
        function()
          require("goto-preview").goto_preview_definition()
        end,
      },
    },
    config = true,
  },
  {
    "sethen/line-number-change-mode.nvim",
    event = "UIEnter",
  },
  -- {
  --   'bhugovilela/palette.nvim',
  --   cmd = { "Palette" },
  -- }
}
