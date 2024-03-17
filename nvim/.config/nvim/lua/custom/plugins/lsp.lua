return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/schemastore.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require("mason").setup()

      local servers = vim.F.npcall(require, 'config.lsp_servers') or {}
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_lsp = vim.F.npcall(require, "cmp_nvim_lsp")
      if cmp_lsp then
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      end

      local ufo = vim.F.npcall(require, "ufo")
      if ufo then
        capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        }

        ufo.setup()
      end

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = {
          "bashls",
          "cssls",
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
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})

            require('lspconfig')[server_name].setup(server)
          end,
        }
      })

      require('mason-tool-installer').setup({
        ensure_installed = {
          'stylua',
          'php-cs-fixer',
          'prettierd',
          'sql-formatter',
          'jq',
        },
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
        callback = function(event)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
          vim.keymap.set("n", "gf", vim.lsp.buf.references, { desc = "Find references" })
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, { desc = "Show hover documentation" })
          -- vim.keymap.set("n", "sh", vim.lsp.buf.signature_help, { desc = "Show signature help of the function under cursor" })
          -- vim.keymap.set("n", "sd", vim.lsp.buf.hover, { desc = "Show documentation" })
          vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show error" })
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next error" })
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous error" })

          vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
          vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename the thing under cursor in the buffer" })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
          vim.keymap.set("n", "<leader>rr", "<CMD>LspRestart<CR>", { desc = "Restart LSP" })
          -- vim.keymap.set("n", "\\\\", function()
          --     vim.lsp.buf.format({ async = true })
          -- end, { desc = "Run code format" })

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        php = { "php-cs-fixer" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
      },
      format_on_save = false,
      format_after_save = false,
    },
    config = function(_, opts)
      require("conform").setup(opts)

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = false }),
        callback = function()
          vim.keymap.set("n", "\\\\", function()
            require("conform").format({ async = true, lsp_fallback = true })
          end, { desc = "Run code format" })
        end,
      })
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    init = function()
      vim.keymap.set("x", "<leader>re", function() require('refactoring').refactor('Extract Function') end)
      vim.keymap.set("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end)
      vim.keymap.set("n", "<leader>rI", function() require('refactoring').refactor('Inline Function') end)
      vim.keymap.set({ "n", "x" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end)
      vim.keymap.set("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end)
    end,
    opts = {
      show_success_message = true,
    },
  },
}
