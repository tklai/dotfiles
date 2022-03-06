local has_cmp, cmp = pcall(require, "cmp")
local has_snip_engine, luasnip = pcall(require, "luasnip")

if not has_cmp or not has_snip_engine then
  return
end

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.shortmess:append("c")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    -- DO NOT SET `select` to true in `confirm()`.
    -- Otherwise, the first item will be selected even you didn't select anything.
    ["<CR>"] = cmp.mapping.confirm(),
  },
  sources = {
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 5 },
  },
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
})

require("luasnip.loaders.from_vscode").load()
