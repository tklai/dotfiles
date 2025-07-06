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
    event = "VeryLazy",
    opts = {
      fuzzy = { implementation = "prefer_rust" },
      cmdline = { enabled = false },
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
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
          window = {
            border = "rounded",
            min_width = 50,
            winhighlight = "",
          },
          --- draw function comes from OXY2DEV and trimmed
          --- @see https://github.com/OXY2DEV/nvim/blob/3c0c8a0d8770ed3a9f6dc3bb833a2f0723fbea77/lua/plugins/lsp.lua#L168-L231
          draw = function(data)
            local buf = data.window.buf
            local src_buf = vim.api.nvim_get_current_buf()

            local lines = {}

            if data.item and data.item.documentation then
              lines = vim.split(data.item.documentation.value or "", "\n", { trimempty = true })
            end

            local details = vim.split(data.item.detail or "", "\n", { trimempty = true })

            if #details > 0 then
              table.insert(details, 1, string.format("```%s", vim.bo[src_buf].ft or ""))
              table.insert(details, "```")

              if #lines > 0 then
                details = vim.list_extend(details, {
                  "",
                  "Detail:",
                  "----------",
                  "",
                })
              end
            end

            local visible_lines = vim.list_extend(details, lines)
            vim.api.nvim_buf_set_lines(buf, 0, -1, false, visible_lines)
          end,
        },
      },
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
      { ",se", ":ScissorsEditSnippet<CR>" },
      { ",sa", mode = { "n", "x" }, ":ScissorsAddNewSnippet<CR>" },
    },
  },
}
