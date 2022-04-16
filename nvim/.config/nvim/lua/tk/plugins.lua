_ = pcall(vim.cmd, "packadd packer.nvim")

return require("packer").startup(function(use)
  -- Core
  use("wbthomason/packer.nvim")
  use("lewis6991/impatient.nvim")
  use("nathom/filetype.nvim")
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
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-media-files.nvim",
    },
  })

  -- Auto-completion
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
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
    run = ":TSUpdate",
  })

  use("nvim-orgmode/orgmode")

  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  use("lewis6991/gitsigns.nvim")
  use("kyazdani42/nvim-tree.lua")
  use("akinsho/bufferline.nvim")

  use("akinsho/toggleterm.nvim")

  use("windwp/nvim-spectre")
end)
