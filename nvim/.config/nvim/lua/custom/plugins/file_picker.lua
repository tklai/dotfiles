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
          formatter = "path.dirname_first",
        },
        winopts = {
          border = "none",
          row = 1,
          col = 0,
          width = 1,
          height = 0.3,
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

      fzf.register_ui_select();
    end,
  },
}
