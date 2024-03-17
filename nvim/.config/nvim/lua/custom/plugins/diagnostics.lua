return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    init = function()
      vim.keymap.set("n", "<leader>dd", "<cmd>TroubleToggle<cr>", { desc = "Trouble" })
    end,
  }
}
