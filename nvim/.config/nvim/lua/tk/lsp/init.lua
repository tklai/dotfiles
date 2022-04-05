local has_lsp_config, lspconfig = pcall(require, "lspconfig")
local has_installer, lsp_installer_servers = pcall(require, "nvim-lsp-installer.servers")
if not has_lsp_config or not has_installer  then
  return
end

local keymap = require("tk.utils").keymap

local lsp_servers = {
  "bashls",
  "cssls",
  "emmet_ls",
  "html",
  "jsonls",
  "tsserver",
  "sumneko_lua",
  "intelephense",
  "yamlls",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if has_cmp_lsp then
  capabilities = cmp_lsp.update_capabilities(capabilities)
end

local server_specific_opts = {
  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          },
        },
      },
    },
  },
}

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
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_create_augroup("lsp_document_highlight", {})
    vim.api.nvim_create_autocmd("CursorHold", {
      group = "lsp_document_highlight",
      desc = "Show the document highlight",
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      desc = "Clear references",
      callback = vim.lsp.buf.clear_references,
    })
  end
end

local custom_on_attach = function(client, bufnr)
  local buf_keymap = function(mode, lhs, rhs, desc, opts)
    local default_opts = { buffer = 0 }

    opts = vim.tbl_extend("force", default_opts, opts or {})

    keymap(mode, lhs, rhs, desc, opts)
  end

  buf_keymap("n", "gd", vim.lsp.buf.definition, "Go to definition")
  buf_keymap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  buf_keymap("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
  buf_keymap("n", "gf", vim.lsp.buf.references, "Find references")
  buf_keymap("n", "K", vim.lsp.buf.hover, "Show hover documentation")
  -- buf_keymap("n", '<C-k>', vim.lsp.buf.signature_help, "Show signature help of the function under cursor")
  -- buf_keymap("n", '<leader>D', vim.lsp.buf.type_definition, "Go to type definition")
  -- buf_keymap("n", '<leader>rn', vim.lsp.buf.rename, "Rename the thing under cursor in the buffer")
  -- buf_keymap("n", '<leader>ca', vim.lsp.buf.code_action, "Code action")
  buf_keymap("n", "<leader>rf", vim.lsp.buf.formatting, "Run formatter")

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

for _, server in pairs(lsp_servers) do
  local server_available, requested_server = lsp_installer_servers.get_server(server)
  if server_available then
    requested_server:on_ready(function()
      local opts = {
        capabilities = capabilities,
        on_attach = custom_on_attach,
        handlers = handlers,
      }

      if server_specific_opts[server] then
        opts = vim.tbl_extend("force", opts, server_specific_opts[server])
      end

      requested_server:setup(opts)
    end)

    if not requested_server:is_installed() then
      requested_server:install()
    end
  end
end

local present, null_ls = pcall(require, "null-ls")
if present then
  null_ls.setup({
    sources = {
      -- Completion
      null_ls.builtins.completion.spell,
      -- Diagnostics
      null_ls.builtins.diagnostics.eslint,
      -- Formatter
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.phpcsfixer,
    },
  })
end
