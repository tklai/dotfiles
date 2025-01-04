local bottom_pane = function(opts)
  opts = opts or {}

  local theme_opts = {
    sorting_strategy = "ascending",

    layout_strategy = "bottom_pane",
    layout_config = {
      height = 25,
    },

    border = true,
    borderchars = {
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
  }
  if opts.layout_config and opts.layout_config.prompt_position == "bottom" then
    theme_opts.borderchars = {
      prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    }
  end

  return vim.tbl_deep_extend("force", theme_opts, opts)
end

local function merge_config(opts)
  opts.defaults = opts.defaults or {}
  opts.theme = opts.theme or {}
  return vim.tbl_deep_extend("force", opts.theme, opts.defaults)
end

local defaults = merge_config({
  theme = bottom_pane(),
  defaults = {
    file_ignore_patterns = {
      "public/packages/",
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
    },
  },
})

return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    init = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader><leader>", builtin.find_files)
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
      defaults = defaults,
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
}
