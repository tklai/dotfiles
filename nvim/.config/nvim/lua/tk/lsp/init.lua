local lspconfig = vim.F.npcall(require, "lspconfig")
local mason = vim.F.npcall(require, "mason")
local mason_lspconfig = vim.F.npcall(require, "mason-lspconfig")
if not lspconfig or not mason or not mason_lspconfig then
  return
end

local Keymap = require("tk.utils.keymap")
local nnoremap = Keymap.nnoremap

require("tk.config._completion")

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

local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

-- LSP settings (for overriding per client)
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

local lsp_highlight_document = function(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_create_augroup("lsp_document_highlight", {})
    vim.api.nvim_create_autocmd("CursorHold", {
      group = "lsp_document_highlight",
      desc = "Show the document highlight",
      buffer = 0,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      desc = "Clear references",
      buffer = 0,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

local custom_on_attach = function(client, bufnr)
  nnoremap("gd", vim.lsp.buf.definition, { desc = "Go to definition" })
  nnoremap("gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
  nnoremap("gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
  nnoremap("gf", vim.lsp.buf.references, { desc = "Find references" })
  nnoremap("K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
  nnoremap("sh", vim.lsp.buf.signature_help, { desc = "Show signature help of the function under cursor" })
  nnoremap("sd", vim.lsp.buf.hover, { desc = "Show documentation" })
  nnoremap("<leader>D", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
  nnoremap("<leader>rn", vim.lsp.buf.rename, { desc = "Rename the thing under cursor in the buffer" })
  nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
  nnoremap("<leader>cf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Run code format" })

  lsp_highlight_document(client)

  vim.api.nvim_create_augroup("lsp_diagnostic", {})
  vim.api.nvim_create_autocmd("CursorHold", {
    group = "lsp_diagnostic",
    desc = "Show diagnostic float",
    callback = function()
      vim.diagnostic.open_float()
    end,
  })
end

vim.diagnostic.config({
  -- I use float.
  virtual_text = false,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
  },
  severity_sort = true,
})

mason.setup({
})

mason_lspconfig.setup({
  ensure_installed = {
    "bashls",
    "cssls",
    "denols",
    "diagnosticls",
    "dockerls",
    "emmet_ls",
    "eslint",
    "gopls",
    "html",
    "intelephense",
    "jsonls",
    "rust_analyzer",
    "sumneko_lua",
    "sqls",
    "tsserver",
    "vuels",
    "yamlls",
  },
  automatic_installation = true,
})

local config = require("tk.lsp.config")
for _, server in pairs(mason_lspconfig.get_installed_servers()) do
  local opts = vim.tbl_extend("force", {
    capabilities = capabilities,
    on_attach = custom_on_attach,
    handlers = handlers,
  }, config[server] or {})

  lspconfig[server].setup(opts)
end

local null_ls = vim.F.npcall(require, "null-ls")
if null_ls then
  null_ls.setup({
    sources = {
      -- Formatter
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.phpcsfixer,
      -- Completion
      null_ls.builtins.completion.spell,
    },
  })
end
