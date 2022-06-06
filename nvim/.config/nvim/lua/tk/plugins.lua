_ = pcall(vim.cmd, "packadd packer.nvim")

return require("packer").startup(function(use)
  -- Core
  use("wbthomason/packer.nvim")
  use("lewis6991/impatient.nvim")
  -- use("nathom/filetype.nvim")
  use({
    "antoinemadec/FixCursorHold.nvim",
    run = function()
      vim.g.curshold_updatetime = 1000
    end,
  })
  use("nvim-lua/plenary.nvim")

  -- LSP
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  use("jose-elias-alvarez/null-ls.nvim")

  -- Theme
  -- use({"catppuccin/nvim", as = "catppuccin"})
  use("rebelot/kanagawa.nvim")

  use({
    "feline-nvim/feline.nvim",
    config = function()
      -- Let me revisit once I get the sense of art.
      require("feline").setup()
    end,
  })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      -- Extensions
      "nvim-telescope/telescope-media-files.nvim",
    },
    config = function()
      require("tk.config._telescope")
    end,
  })

  -- Auto-completion
  use({
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").load()
    end,
  })
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      -- Sources
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      -- Default Snippets
      "rafamadriz/friendly-snippets",
    },
  })

  -- Tree-sitter
  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    run = ":TSUpdate",
    config = function()
      require("tk.config._treesitter")
    end,
  })

  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        update_cwd = true,
        view = {
          width = 50,
          side = "right",
        },
      })

      vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { noremap = true })
    end,
  })
  use({
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
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
      })
    end,
  })

  use({
    "akinsho/toggleterm.nvim",
    config = function()
      require("tk.config._toggleterm")
    end,
  })

  use({
    "windwp/nvim-spectre",
    config = function()
      require("tk.config._spectre")
    end,
  })
end)
