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
  nnoremap("gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
  nnoremap("gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
  nnoremap("gf", vim.lsp.buf.references, { buffer = bufnr, desc = "Find references" })
  nnoremap("K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show hover documentation" })
  nnoremap("sh", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Show signature help of the function under cursor" })
  nnoremap("sd", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show documentation" })
  nnoremap("<leader>D", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Go to type definition" })
  nnoremap("<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename the thing under cursor in the buffer" })
  nnoremap("<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Show code actions" })
  nnoremap("<leader>rr", "<CMD>LspRestart<CR>", { buffer = bufnr, desc = "Restart LSP" })
  nnoremap("\\\\", function()
    vim.lsp.buf.format({ async = true })
  end, { desc = "Run code format" })

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

local dap = vim.F.npcall(require, "dap")
local dapui = vim.F.npcall(require, "dapui")
if dap then
  dap.adapters.php = {
    type = "executable",
    command = "php-debug-adapter",
  }

  dap.configurations.php = {
    {
      type = "php",
      request = "launch",
      name = "Listen for Xdebug (Workspace)",
      port = 9003,
      ignore = {
        "**/vendor/**/*.php",
      },
      skipFiles = {
        "**/vendor/**",
      },
      pathMappings = {
        ["/var/www"] = "${workspaceFolder}/../../../projects",
      },
    },
  }

  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
  vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })

  nnoremap("<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
  nnoremap("<leader>dB", dap.clear_breakpoints, { desc = "Clear Breakpoints" })
  nnoremap("<leader>dc", dap.continue, { desc = "Start Debug" })
  nnoremap("<leader>dC", dap.restart, { desc = "Restart Debug" })
  nnoremap("<leader>dd", function()
    dap.terminate()

    -- In case DAP UI does not close
    if dapui then
      dapui.close()
    end
  end, { desc = "Terminate Debug" })
  nnoremap("<leader>do", dap.step_over, { desc = "Debug Step over" })
  nnoremap("<leader>di", dap.step_into, { desc = "Debug Step Into" })
  nnoremap("<leader>dO", dap.step_out, { desc = "Debug Step up" })

  if dapui then
    dapui.setup({
      layouts = {
        {
          elements = {
            "scopes",
            "breakpoints",
            -- "stacks",
            -- "watches",
            -- "repl",
          },
          size = 48,
          position = "right",
        },
        {
          elements = {
            -- "console",
          },
          size = 0.2,
          position = "bottom",
        },
      },
    })

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end

  local dap_vritual_text = vim.F.npcall(require, "nvim-dap-virtual-text")
  if dap_vritual_text then
    dap_vritual_text.setup()
  end
end
