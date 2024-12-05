return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      {
        "s",
        mode = { "n", "o", "x" },
        function()
          require("flash").jump()
        end,
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
      },
    },
    opts = {
      modes = {
        search = { enabled = false },
      },
    },
  },
  {
    "chaoren/vim-wordmotion",
    event = "BufEnter",
  },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },
  {
    "jinh0/eyeliner.nvim",
    enabled = false,
    event = "BufEnter",
    config = function()
      require("eyeliner").setup({
        highlight_on_key = true,
        default_keymaps = false,
        dim = true, -- Optional
      })

      local function eyeliner_jump(key)
        local forward = vim.list_contains({ "t", "f" }, key)
        return function()
          require("eyeliner").highlight({ forward = forward })
          return require("demicolon.jump").horizontal_jump(key)()
        end
      end

      local nxo = { "n", "x", "o" }
      local opts = { expr = true }

      vim.keymap.set(nxo, "f", eyeliner_jump("f"), opts)
      vim.keymap.set(nxo, "F", eyeliner_jump("F"), opts)
      vim.keymap.set(nxo, "t", eyeliner_jump("t"), opts)
      vim.keymap.set(nxo, "T", eyeliner_jump("T"), opts)
    end,
  },
}
