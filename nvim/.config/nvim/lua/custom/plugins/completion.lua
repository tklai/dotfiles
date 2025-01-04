local snippets_dir = vim.fn.stdpath("config") .. "/snippets"

vim.opt.shortmess:append("c")
vim.opt.completeopt = "menu,menuone,noselect"

return {
  -- {
  --   "hrsh7th/nvim-cmp",
  --   event = "InsertEnter",
  --   dependencies = {
  --     -- Engines
  --     "L3MON4D3/LuaSnip",
  --     -- Sources
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-nvim-lua",
  --     "saadparwaiz1/cmp_luasnip",
  --     -- Pre-defined Snippets
  --     "rafamadriz/friendly-snippets",
  --   },
  --   config = function()
  --     local cmp = require("cmp")
  --     local luasnip = require("luasnip")
  --     require("luasnip.loaders.from_vscode").lazy_load({
  --       paths = { snippets_dir },
  --     })
  --
  --     vim.keymap.set({ "i", "s" }, "<C-j>", function()
  --       if luasnip.expand_or_jumpable() then
  --         luasnip.expand_or_jump()
  --       end
  --     end)
  --
  --     vim.keymap.set({ "i", "s" }, "<C-k>", function()
  --       if luasnip.jumpable(-1) then
  --         luasnip.jump(-1)
  --       end
  --     end)
  --
  --     cmp.setup({
  --       snippet = {
  --         expand = function(args)
  --           require("luasnip").lsp_expand(args.body)
  --         end,
  --       },
  --       mapping = {
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<C-d>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-e>"] = cmp.mapping.abort(),
  --         ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-h>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }, { "i", "c" }),
  --         ["<M-h>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }, { "i", "c" }),
  --       },
  --       sources = cmp.config.sources({
  --         { name = "nvim_lsp" },
  --         { name = "luasnip" },
  --         { name = "path" },
  --         { name = "buffer", keyword_length = 4 },
  --       }),
  --       completion = {
  --         keyword_length = 1,
  --       },
  --       formatting = {
  --         fields = { "abbr", "kind" },
  --       },
  --     })
  --   end,
  -- },
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    opts = {
      keymap = {
        preset = "default",
        ["<C-b>"] = {}, -- <C-b> to <C-d>
        ["<C-d>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<C-p>"] = {}, -- <C-p> to <C-j>
        ["<C-n>"] = {}, -- <C-n> to <C-k>
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },

        ["<C-y>"] = {}, -- <C-y> to <C-h>
        ["<C-h>"] = { "select_and_accept" },
      },
      documentation = { auto_show = true, auto_show_delay_ms = 250 },
      signature = { enabled = true },
    },
  },
  {
    "chrisgrieser/nvim-scissors",
    event = "VeryLazy",
    opts = {
      snippetDir = snippets_dir,
    },
    keys = {
      { ",se", function() require("scissors").editSnippet() end },
      { ",sa", mode = { "n", "x" }, function() require("scissors").addNewSnippet() end },
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
}
