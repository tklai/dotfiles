local has_cmp, cmp = pcall(require, "cmp")
local has_snip_engine, luasnip = pcall(require, "luasnip")

if not has_cmp or not has_snip_engine then
  return nil
end

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.shortmess:append("c")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    -- DO NOT SET `select` to true in `confirm()`.
    -- Otherwise, the first item will be selected even you didn't select anything.
    ["<CR>"] = cmp.mapping.confirm(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer" },
  }),
  window = {
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },
  },
})

require("luasnip.loaders.from_vscode").load()
