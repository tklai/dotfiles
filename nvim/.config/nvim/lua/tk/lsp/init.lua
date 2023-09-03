local lspconfig = vim.F.npcall(require, "lspconfig")
local mason = vim.F.npcall(require, "mason")
local mason_lspconfig = vim.F.npcall(require, "mason-lspconfig")
if not lspconfig or not mason or not mason_lspconfig then
  return
end

local Keymap = require("tk.utils.keymap")
local nnoremap = Keymap.nnoremap

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_lsp = vim.F.npcall(require, "cmp_nvim_lsp")
if cmp_lsp then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

local ufo = vim.F.npcall(require, "ufo")
if ufo then
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  ufo.setup()
end

local functions_attach = {
  lsp_highlight_document = function(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
      vim.api.nvim_create_augroup("lsp_document_highlight", {})
      vim.api.nvim_create_autocmd("CursorHold", {
        group = "lsp_document_highlight",
        desc = "Show the document highlight",
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
        group = "lsp_document_highlight",
        desc = "Clear references",
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
}

local custom_on_attach = function(client, bufnr)
  nnoremap("gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
  nnoremap("do", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
  nnoremap("gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
  nnoremap("gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
  nnoremap("gf", vim.lsp.buf.references, { buffer = bufnr, desc = "Find references" })
  nnoremap("K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show hover documentation" })
  nnoremap("sh", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Show signature help of the function under cursor" })
  nnoremap("sd", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show documentation" })
  nnoremap("se", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show error" })
  nnoremap("ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Show code actions" })
  nnoremap("<leader>D", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Go to type definition" })
  nnoremap("<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename the thing under cursor in the buffer" })
  nnoremap("<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Show code actions" })
  nnoremap("<leader>rr", "<CMD>LspRestart<CR>", { buffer = bufnr, desc = "Restart LSP" })
  nnoremap("\\\\", function()
    vim.lsp.buf.format({ async = true })
  end, { desc = "Run code format" })
  -- nnoremap("<leader>uh", function()
  --   if false and vim.lsp.inlay_hint and client.server_capabilities.inlayHintProvider then
  --     vim.lsp.inlay_hint(0, nil)
  --   else
  --     print('LSP server does not support inlay hints.')
  --   end
  -- end, { buffer = bufnr, desc = "Toggle Inlay Hints" })

  functions_attach.lsp_highlight_document(client, bufnr)

  -- vim.api.nvim_create_augroup("lsp_diagnostic", {})
  -- vim.api.nvim_create_autocmd("CursorHold", {
  --   group = "lsp_diagnostic",
  --   desc = "Show diagnostic float",
  --   buffer = bufnr,
  --   callback = function()
  --     vim.diagnostic.open_float()
  --   end,
  -- })

  -- if vim.lsp.inlay_hint and client.server_capabilities.inlayHintProvider then
  --   vim.lsp.inlay_hint(bufnr, true)
  -- end
end

vim.diagnostic.config({
  -- I use float / lsp lines.
  virtual_text = false,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
  },
  severity_sort = true,
})

mason.setup({})

mason_lspconfig.setup({
  ensure_installed = {
    "bashls",
    "cssls",
    -- "denols",
    -- "diagnosticls",
    "dockerls",
    "emmet_ls",
    "eslint",
    -- "gopls",
    "html",
    -- "phpactor",
    "intelephense",
    "jsonls",
    "rust_analyzer",
    "lua_ls",
    "sqlls",
    "svelte",
    "tsserver",
    "vuels",
    "yamlls",
    "zls",
  },
  automatic_installation = true,
})

local config = require("tk.lsp.config")
for _, server in pairs(mason_lspconfig.get_installed_servers()) do
  local opts = vim.tbl_extend("force", {
    capabilities = capabilities,
    on_attach = custom_on_attach,
  }, config[server] or {})

  lspconfig[server].setup(opts)
end

local null_ls = vim.F.npcall(require, "null-ls")
if null_ls then
  null_ls.setup({
    sources = {
      -- Formatter
      null_ls.builtins.formatting.phpcsfixer,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.stylua,
    },
  })
end
