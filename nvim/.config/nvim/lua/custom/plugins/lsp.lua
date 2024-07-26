return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/schemastore.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      {
        "stevearc/conform.nvim",
        opts = {
          formatters_by_ft = {
            lua = { "stylua" },
            php = { "php_cs_fixer" },
            javascript = { "prettierd" },
            typescript = { "prettierd" },
          },
          format_on_save = false,
          format_after_save = false,
          formatters = {
            ["php_cs_fixer"] = {
              append_args = function(_, ctx)
                local args = {}

                local config_location = vim.fs.find(".php-cs-fixer.dist.php", {
                  upward = true,
                  path = ctx.dirname,
                })[1]

                if config_location then
                  table.insert(args, "--config=" .. config_location)
                end

                return args
              end,
            },
          },
        },
      },
    },
    config = function()
      require("mason").setup()

      local servers = vim.F.npcall(require, "config.lsp_servers") or {}
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_lsp = vim.F.npcall(require, "cmp_nvim_lsp")
      if cmp_lsp then
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
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
          "psalm",
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
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

            require("lspconfig")[server_name].setup(server)
          end,
        },
      })

      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "php-cs-fixer",
          "prettierd",
          "sql-formatter",
          "jq",
        },
      })

      local definition_on_list = function(split_cmd)
        split_cmd = split_cmd or "vsplit"

        return function(options)
          if #options.items == 0 then
            vim.notify("No definition found.", vim.log.levels.INFO)

            return
          end

          -- if there are multiple items, warn the user
          if #options.items > 1 then
            vim.notify("Multiple items found, opening first one...", vim.log.levels.WARN)
          end

          local meta = options.items[1]

          -- Same file will be opened, notify and exit
          if
            meta.filename == vim.api.nvim_buf_get_name(0)
            and meta.lnum == vim.api.nvim_win_get_cursor(0)[1]
          then
            vim.notify("Self-referencing definition", vim.log.levels.INFO)

            return
          end

          -- Open the first item in a vertical split
          local item = options.items[1]
          local cmd = split_cmd .. " +" .. item.lnum .. " " .. item.filename .. "|" .. "normal " .. item.col .. "|"

          vim.cmd(cmd)
        end
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("CustomLspAttach", { clear = true }),
        callback = function(event)
          vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
          end, { desc = "Go to definition" })
          vim.keymap.set("n", "gdv", function()
            vim.lsp.buf.definition({ on_list = definition_on_list() })
          end, { desc = "Go to definition (Split Vertical)" })
          vim.keymap.set("n", "gdx", function()
            vim.lsp.buf.definition({ on_list = definition_on_list("split") })
          end, { desc = "Go to definition (Split Horizontal)" })

          -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
          vim.keymap.set("n", "gf", vim.lsp.buf.references, { desc = "Find references" })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
          -- vim.keymap.set("n", "sh", vim.lsp.buf.signature_help, { desc = "Show signature help of the function under cursor" })
          -- vim.keymap.set("n", "sd", vim.lsp.buf.hover, { desc = "Show documentation" })
          vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show error" })
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next error" })
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous error" })

          vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
          vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
          vim.keymap.set(
            "n",
            "<leader>rn",
            vim.lsp.buf.rename,
            { desc = "Rename the thing under cursor in the buffer" }
          )
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
          vim.keymap.set("n", "<leader>rr", "<CMD>LspRestart<CR>", { desc = "Restart LSP" })
          vim.keymap.set("n", "\\\\", function()
            local conform = vim.F.npcall(require, "conform")
            if conform then
              conform.format({ async = true, lsp_fallback = true })
              vim.notify("Formatted code with Conform", vim.log.levels.INFO)
            else
              vim.lsp.buf.format({ async = true })
              vim.notify("Formatted code with LSP", vim.log.levels.INFO)
            end
          end, { desc = "Run code format" })

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client then
            if client.server_capabilities.documentHighlightProvider then
              vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                callback = vim.lsp.buf.document_highlight,
              })

              vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                callback = vim.lsp.buf.clear_references,
              })
            end

            vim.keymap.set("n", "<leader>uh", function()
              if vim.lsp.inlay_hint and client.server_capabilities.inlayHintProvider then
                local new_status = not vim.lsp.inlay_hint.is_enabled({})

                vim.lsp.inlay_hint.enable(new_status, {})

                vim.notify("LSP inlay_hint status: " .. (new_status and "Enabled" or "Disabled"), vim.log.levels.INFO)
              else
                vim.notify("This LSP server does not support inlay hints.", vim.log.levels.WARN)
              end
            end)
          end

          local betterDiag = vim.F.npcall(require, "better-diagnostic-virtual-text.api")
          if betterDiag then
            betterDiag.setup_buf(event.buf, {
              inline = false,
            })

            vim.keymap.set("n", "<Leader>L", function ()
              local new_status = not vim.diagnostic.is_enabled({ bufnr = event.buf })

              vim.diagnostic.enable(new_status, {bufnr = event.buf})
            end, { desc = "Toggle lsp_lines" })
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
    "ThePrimeagen/refactoring.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    init = function()
      vim.keymap.set("v", "<leader>rr", function()
        require("refactoring").select_refactor()
      end)
    end,
    opts = {
      show_success_message = true,
    },
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {},
    init = function()
      vim.keymap.set("n", "<Leader>L", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },
  {
    "sontungexpt/better-diagnostic-virtual-text",
    event = "LspAttach",
    init = function()
      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    config = true,
    cmd = "Outline",
  },
}
