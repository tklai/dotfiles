local snippets_dir = vim.fn.stdpath("config") .. "/snippets"

return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Engines
      "L3MON4D3/LuaSnip",
      -- Sources
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      -- Pre-defined Snippets
      "rafamadriz/friendly-snippets",
    },
    config = function()
      vim.opt.shortmess:append("c")

      local icons = {
        Text = "",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰇽",
        Variable = "󰂡",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰅲",
        Copilot = "",
      }

      local has_words_before = function()
        local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))

        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { snippets_dir },
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-f>"] = cmp.mapping.scroll_docs(-4),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-Space>"] = cmp.mapping.complete(),
          -- DO NOT SET `select` to true in `confirm()`.
          -- Otherwise, the first item will be selected even you didn't select anything.
          ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
          -- Item Selection
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- that way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "path" },
          { name = "buffer", keyword_length = 4 },
        }),
        completion = {
          completeopt = "menu,menuone,noselect",
          keyword_length = 1,
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(_, vim_item)
            vim_item.menu = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
            vim_item.kind = ""

            return vim_item
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            border = { "", "", "", "", "", "", "", "" },
            winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
          }),
        },
        experimental = {
          native_menu = false,
          ghost_text = false,
        },
      })
    end,
  },
  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim",
    opts = {
      snippetDir = snippets_dir,
    },
    init = function()
      local scissors = require("scissors")

      vim.keymap.set("n", ",se", scissors.editSnippet)
      vim.keymap.set({ "n", "x" }, ",sa", scissors.addNewSnippet)
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
}
