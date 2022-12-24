local my_plugins = {
  -- Core
  ["lewis6991/impatient.nvim"] = {},
  ["nvim-lua/plenary.nvim"] = {},
  ["folke/noice.nvim"] = {
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          lsp_doc_border = true,
        },
      })

      vim.opt.cmdheight = 0
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        config = function()
          require("notify").setup({
            background_colour = "#000000",
            stages = "fade",
          })
        end,
      },
    },
  },

  -- Treesitter - syntax highlighting
  ["nvim-treesitter/nvim-treesitter"] = {
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
  },

  -- LSP and DAP
  ["neovim/nvim-lspconfig"] = {},
  ["williamboman/mason.nvim"] = {},
  ["williamboman/mason-lspconfig.nvim"] = {},
  ["jose-elias-alvarez/null-ls.nvim"] = {},
  ["mfussenegger/nvim-dap"] = {
    enabled = false,
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    }
  },
  ["b0o/schemastore.nvim"] = {},

  -- Folding Plugin
  -- Depends with LSP or treesitter
  ["kevinhwang91/nvim-ufo"] = {
    dependencies = {
      "kevinhwang91/promise-async"
    },
  },
  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
    config = function()
      require("lspsaga").init_lsp_saga({})
    end,
  },
  ["ray-x/lsp_signature.nvim"] = {
    enabled = false,
    config = function()
      require("lsp_signature").setup({
        noice = true,
      })
    end,
  },
  ["gpanders/editorconfig.nvim"] = {},

  -- Theme
  ["catppuccin/nvim"] = {
    name = "catppuccin",
    enabled = false,
  },
  ["rebelot/kanagawa.nvim"] = {},
  ["nvim-lualine/lualine.nvim"] = {
    dependencies = {
      {"kyazdani42/nvim-web-devicons", lazy = true },
    },
  },

  --Telescope
  ["nvim-telescope/telescope.nvim"] = {
    dependencies = {
      -- Extensions
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-media-files.nvim" },
    },
  },

  -- Tools
  -- Auto-completion
  ["L3MON4D3/LuaSnip"] = {},
  ["hrsh7th/nvim-cmp"] = {
    dependencies = {
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
    dependencies = {
      "nvim-lua/plenary.nvim",
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
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
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

  ["mbbill/undotree"] = {},
}

local lazy_plugins = {}
for name, plugin in pairs(my_plugins) do
  if type(name) == "string" and not plugin[1] then
    plugin[1] = name
  end

  table.insert(lazy_plugins, plugin)
end

require("lazy").setup(lazy_plugins, {})
