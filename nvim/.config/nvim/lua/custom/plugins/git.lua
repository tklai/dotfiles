return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    keys = {
      -- { "<leader>gg", "<cmd>Git<CR>" },
      { "<leader>gb", "<cmd>Git blame<CR>" },
    }
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    keys = {
      {"<leader>gg", "<cmd>LazyGit<CR>" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
