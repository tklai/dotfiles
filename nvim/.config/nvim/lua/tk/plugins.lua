_ = pcall(vim.cmd, "packadd packer.nvim")

return require("packer").startup(function(use)
  -- Core
  use("wbthomason/packer.nvim")
  use("lewis6991/impatient.nvim")
  use("nvim-lua/plenary.nvim")

  -- LSP
  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use({
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
  })
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        local saga = require("lspsaga")

        saga.init_lsp_saga({
            -- your configuration
        })
    end,
  })
  use({
    "ray-x/lsp_signature.nvim",
    config = function()
      require "lsp_signature".setup({})
    end,
  })

  use("gpanders/editorconfig.nvim")

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
      "nvim-treesitter/nvim-treesitter-context",
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
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
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

      require("tk.utils.keymap").nnoremap("<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
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
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("tk.config._neogit")
    end,
  })

  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  })

  use ({
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure({
        filetypes_denylist = {
          'NvimTree',
          'TelescopePrompt',
        },
      })

      vim.api.nvim_set_hl(0, "IlluminatedWordText", {
        bg = "#54546D",
      })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", {
        bg = "#54546D",
      })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", {
        bg = "#54546D",
      })
    end,
  })
end)
