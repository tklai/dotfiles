return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    branch = "v2.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    init = function()
      require("tk.utils.keymap").nnoremap("<C-b>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
    end,
    opts = {
      window = {
        position = "right",
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
        follow_current_file = true,
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
    -- enabled = false,
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
    config = function()
      require("neogen").setup()
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>af", function()
        require("neogen").generate({ type = "func" })
      end, opts)

      vim.keymap.set("n", "<leader>ac", function()
        require("neogen").generate({ type = "class" })
      end, opts)

      vim.keymap.set("n", "<leader>at", function()
        require("neogen").generate({ type = "type" })
      end, opts)
    end,
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
  },
  {
    "Bekaboo/deadcolumn.nvim",
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
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
}
