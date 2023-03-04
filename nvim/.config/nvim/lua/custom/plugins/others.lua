return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    init = function()
      require("tk.utils.keymap").nnoremap("<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
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
    "simrat39/symbols-outline.nvim",
    config = true,
    cmd = "SymbolsOutline",
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
    "jidn/vim-dbml",
    -- enabled = false,
    ft = "dbml",
  },
  {
    "m4xshen/autoclose.nvim",
    enabled = false,
    config = true,
  },

  {
    "shortcuts/no-neck-pain.nvim",
    enabled = false,
    version = "*",
    opts = {
      enableOnVimEnter = true,
      width = 120,
      integrations = {
        NvimTree = { position = "right" },
        undotree = { position = "left" },
      },
    },
  },
  {
    "roobert/search-replace.nvim",
    event = "BufEnter",
    config = true,
  },
  {
    "asiryk/auto-hlsearch.nvim",
    config = true,
    event = "BufEnter",
  },
  {
    "chaoren/vim-wordmotion",
  },
}
