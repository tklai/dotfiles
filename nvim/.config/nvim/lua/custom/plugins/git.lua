return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    init = function()
      vim.keymap.set('n', '<leader>gg', '<cmd>Git<CR>')
      vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<CR>')
    end,
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
