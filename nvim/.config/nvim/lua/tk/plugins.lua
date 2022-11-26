local plugins = {
  -- Core
  ["wbthomason/packer.nvim"] = {},
  ["lewis6991/impatient.nvim"] = {},
  ["nvim-lua/plenary.nvim"] = {},

  -- Treesitter - syntax highlighting
  ["nvim-treesitter/nvim-treesitter"] = {
    requires = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    run = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
  },

  -- LSP and DAP
  ["neovim/nvim-lspconfig"] = {},
  ["williamboman/mason.nvim"] = {},
  ["williamboman/mason-lspconfig.nvim"] = {},
  ["jose-elias-alvarez/null-ls.nvim"] = {},
  ["mfussenegger/nvim-dap"] = {},
  ["b0o/schemastore.nvim"] = {},

  -- Folding Plugin
  -- Depends with LSP or treesitter
  ["kevinhwang91/nvim-ufo"] = {
    requires = "kevinhwang91/promise-async",
  },
  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
    config = function()
      local saga = require("lspsaga")

      saga.init_lsp_saga({
        -- your configuration
      })
      -- vim.F.npcall('plugins.lspsaga')
    end,
  },
  ["ray-x/lsp_signature.nvim"] = {
    config = function()
      require("lsp_signature").setup({})
    end,
  },
  ["gpanders/editorconfig.nvim"] = {},

  -- Theme
  -- ["catppuccin/nvim"] = {
  --   as = "catppuccin"
  -- },
  ["rebelot/kanagawa.nvim"] = {},
  ["nvim-lualine/lualine.nvim"] = {
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup({})
    end,
  },

  --Telescope
  ["nvim-telescope/telescope.nvim"] = {
    requires = {
      -- Extensions
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-media-files.nvim" },
    },
    config = function()
      require("plugins.telescope")
    end,
  },

  -- Tools
  -- Auto-completion
  ["L3MON4D3/LuaSnip"] = {
    config = function()
      require("luasnip.loaders.from_vscode").load()
    end,
  },
  ["hrsh7th/nvim-cmp"] = {
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
  },

  ["lewis6991/gitsigns.nvim"] = {
    config = function()
      require("gitsigns").setup()
    end,
  },
  ["sindrets/diffview.nvim"] = {
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
  },
  ["kyazdani42/nvim-tree.lua"] = {
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
  },
  ["akinsho/bufferline.nvim"] = {
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
  },

  ["danymat/neogen"] = {
    requires = {
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

  ["numToStr/Comment.nvim"] = {
    config = function()
      require("Comment").setup()
    end,
  },

  ["simrat39/symbols-outline.nvim"] = {
    config = function()
      require("symbols-outline").setup()
    end,
  },

  ["TimUntersberger/neogit"] = {
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("plugins.neogit")
    end,
  },

  ["RRethy/vim-illuminate"] = {
    config = function()
      require("illuminate").configure({
        filetypes_denylist = {
          "NvimTree",
          "TelescopePrompt",
        },
      })
    end,
  },
}

return require("packer").startup({
  function(use)
    for name, plugin in pairs(plugins) do
      if type(name) == "string" and not plugin[1] then
        plugin[1] = name
      end

      use(plugin)
    end
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
})
