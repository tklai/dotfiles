return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader><leader>", "<cmd>FzfLua files<cr>" },
      { "<leader>ff", "<cmd>FzfLua files<cr>" },
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>" },
      { "<leader>fw", "<cmd>FzfLua grep_cword<cr>" },
      { "<leader>fW", "<cmd>FzfLua grep_cword<cr>" },
      { "<leader>ds", "<cmd>FzfLua lsp_workspace_symbols<cr>" },
      { "<leader>dS", "<cmd>FzfLua lsp_live_workspace_symbols<cr>" },
      { "<leader>vh", "<cmd>FzfLua help_tags<cr>" },
    },
    config = function()
      local fzf = require("fzf-lua")
      local actions = fzf.actions

      fzf.setup({
        fzf_colors = true,
        fzf_opts = {
          ["--no-scrollbar"] = true,
        },
        defaults = {
          default = vim.fn.exepath("bat") and "bat" or "cat",
          formatter = "path.dirname_first",
        },
        winopts = {
          border = "none",
          row = 1,
          col = 0,
          width = 1,
          height = 0.4,
          backdrop = 100,
          preview = {
            title = false,
          },
        },
        keymap = {
          builtin = {
            true,
            ["<C-d>"] = "preview-page-down",
            ["<C-u>"] = "preview-page-up",
          },
          fzf = {
            true,
            ["ctrl-d"] = "preview-page-down",
            ["ctrl-u"] = "preview-page-up",
            ["ctrl-q"] = "select-all+accept",
          },
        },
        actions = {
          files = {
            true,
            ["ctrl-s"] = false,
            ["ctrl-x"] = actions.file_split,
          },
        },
      })

      fzf.register_ui_select()
    end,
  },
  {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      {
        "<leader>-",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = "<Nop>",
      },
    },
    init = function()
      vim.g.loaded_netrwPlugin = 1
    end,
  },
}
