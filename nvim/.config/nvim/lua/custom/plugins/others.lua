return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- enabled = false,
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      {
        's1n7ax/nvim-window-picker',
        version = "v1.*",
        config = function()
          require('window-picker').setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              bo = {
                filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                buftype = { 'terminal', "quickfix" },
              },
            },
            other_win_hl_color = '#E46876',
          })
        end,
      }
    },
    init = function()
      require("tk.utils.keymap").nnoremap("<C-b>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
      require("tk.utils.keymap").nnoremap(
        "<leader>tf",
        "<cmd>Neotree reveal<CR>",
        { desc = "Navigate to file entry in Neo-tree" }
      )
    end,
    opts = {
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
      },
      window = {
        position = "right",
        mappings = {
          ["S"] = "split_with_window_picker",
          ["s"] = "vsplit_with_window_picker",
        },
      },
      filesystem = {
        filtered_items = {
          always_show = {
            ".ebextensions",
            ".elasticbeanstalk",
            ".env",
            ".gitignore",
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
      source_selector = {
        winbar = true,
        statusline = false,
        content_layout = "center",
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    cmd = {
      "NvimTreeToggle",
      "NvimTreeFindFile",
    },
    init = function()
      require("tk.utils.keymap").nnoremap("<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
      require("tk.utils.keymap").nnoremap(
        "<leader>tf",
        "<cmd>NvimTreeFindFile<CR>",
        { desc = "Navigate to file entry in NvimTree" }
      )
    end,
    config = function()
      require("nvim-tree").setup({
        update_cwd = true,
        view = {
          width = 50,
          side = "right",
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "UIEnter",
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
      },
    },
  },
  {
    "danymat/neogen",
    event = "BufEnter",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
    },
    keys = {
      {
        "<leader>aa",
        mode = "n",
        function()
          require("neogen").generate()
        end,
      }
    },
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    config = true,
    event = "BufEnter",
  },
  {
    "RRethy/vim-illuminate",
    event = "BufEnter",
    config = function()
      require("illuminate").configure({
        filetypes_denylist = {
          "NvimTree",
          "TelescopePrompt",
        },
      })
    end,
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },
  {
    "asiryk/auto-hlsearch.nvim",
    config = true,
    event = "BufEnter",
  },
  {
    "chaoren/vim-wordmotion",
    event = "BufEnter",
  },
  {
    "Bekaboo/deadcolumn.nvim",
    event = "InsertEnter",
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "o", "x" },
        function()
          require("flash").jump()
        end,
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
      },
    },
  },
  {
    'tomiis4/Hypersonic.nvim',
    event = "CmdlineEnter",
    cmd = "Hypersonic",
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },
  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    opts = {},
  },
  {
    'Wansmer/treesj',
    keys = {
      {
        '<leader>m',
        '<cmd>TSJToggle<CR>',
        { desc = 'Join / Split' },
      },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      use_default_keymaps = true,
    },
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
}
