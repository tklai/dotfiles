return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        width = 0.5,
      },
      plugins = {
        gitsigns = true,
        tmux = true,
      },
    },
    init = function()
      vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Zen Mode" })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    opts = {
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
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    event = "VimEnter",
    init = function()
      vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
      vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFile<CR>", { desc = "Navigate to file entry in NvimTree" })
    end,
    opts = {
      update_cwd = true,
      view = {
        width = 50,
        side = "right",
      },
    },
  },
  {
   'mcauley-penney/visual-whitespace.nvim',
    event = "VeryLazy",
    config = true
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
}
