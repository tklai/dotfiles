return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    init = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ff", builtin.find_files)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep)
      vim.keymap.set("n", "<leader>fs", function()
        builtin.grep_string({ search = vim.fn.input("Grep For > ") })
      end)
      vim.keymap.set("n", "<leader>fw", function()
        builtin.grep_string({ search = vim.fn.expand("<cword>") })
      end)
      vim.keymap.set("n", "<leader>fW", function()
        builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
      end)
      vim.keymap.set("n", "<leader>fb", builtin.buffers)
      vim.keymap.set("n", "<leader>vh", builtin.help_tags)
      vim.keymap.set("n", "<leader>ds", builtin.lsp_dynamic_workspace_symbols)
      vim.keymap.set("n", '<leader>"', builtin.registers)
    end,
    opts = {
      defaults = {
        -- layout_strategy = "flex",
        layout_strategy = "vertical",
        layout_config = {
          horizontal = {
            preview_width = 0.4,
            preview_cutoff = 120,
          },
          vertical = {
            prompt_position = "top",
            width = 0.5,
          },
        },
        file_ignore_patterns = {
          "public/packages/",
        },
      },
      pickers = {
        buffers = {
          sort_lastused = true,
        },
      },
      extensions = {
        fzf = {
          --
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      local telescope_extensions = {
        "fzf",
      }

      for _, name in pairs(telescope_extensions) do
        telescope.load_extension(name)
      end
    end,
  },
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      {
        "<leader><leader>",
        function()
          require("telescope").extensions.smart_open.smart_open()
        end,
        desc = "[Telescope] Smart Open",
      },
    },
    config = function()
      require("telescope").load_extension("smart_open")
    end,
  },
}
