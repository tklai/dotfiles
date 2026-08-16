return {
  {
    "neovim/nvim-lspconfig",
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      { "mason-org/mason-lspconfig.nvim", opts = {} },
      { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = {} },
      "b0o/schemastore.nvim",
      {
        "stevearc/conform.nvim",
        enabled = false,
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
      vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/mason/bin")

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
          if meta.filename == vim.api.nvim_buf_get_name(0) and meta.lnum == vim.api.nvim_win_get_cursor(0)[1] then
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
          local map = function(keys, func, options)
            options = options or  {}
            local merged_options = vim.tbl_extend("force", { buffer = event.buf }, options)

            vim.keymap.set("n", keys, func, merged_options)
          end

          map("gd", function()
            vim.lsp.buf.definition()
          end, { desc = "Go to definition" })
          map("gdn", function()
            vim.lsp.buf.definition()
          end, { desc = "Go to definition" })
          map("gdv", function()
            vim.lsp.buf.definition({ on_list = definition_on_list() })
          end, { desc = "Go to definition (Split Vertical)" })
          map("gdx", function()
            vim.lsp.buf.definition({ on_list = definition_on_list("split") })
          end, { desc = "Go to definition (Split Horizontal)" })

          -- map("gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
          map("gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
          map("gf", vim.lsp.buf.references, { desc = "Find references" })
          map("K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
          -- map("sh", vim.lsp.buf.signature_help, { desc = "Show signature help of the function under cursor" })
          -- map("sd", vim.lsp.buf.hover, { desc = "Show documentation" })
          map("<leader>cd", vim.diagnostic.open_float, { desc = "Show error" })
          map("]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
          end, { desc = "Go to next error" })
          map("[d", function()
            vim.diagnostic.jump({ count = 1, float = true })
          end, { desc = "Go to previous error" })

          map("ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
          map("<leader>D", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
          map(
            "<leader>rn",
            vim.lsp.buf.rename,
            { desc = "Rename the thing under cursor in the buffer" }
          )
          map("<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
          map("<leader>rr", "<CMD>LspRestart<CR>", { desc = "Restart LSP" })
          map("\\\\", function()
            local conform = false -- vim.F.npcall(require, "conform")
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

            map("<leader>uh", function()
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

            map("<Leader>L", function()
              local new_status = not vim.diagnostic.is_enabled({ bufnr = event.buf })

              vim.diagnostic.enable(new_status, { bufnr = event.buf })
            end, { desc = "Toggle lsp_lines" })
          end
        end,
      })
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    init = function()
      vim.diagnostic.config({ virtual_text = false })
    end,
    opts = {
      preset = "powerline",
    },
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    config = true,
    cmd = "Outline",
  },
  {
    "bassamsdata/namu.nvim",
    lazy = true,
    cmd = "Namu",
    keys = {
      { "<leader>ss", ":Namu symbols<cr>", { desc = "Jump to LSP symbol", silent = true } },
    },
    opts = {
      -- Enable the modules you want
      namu_symbols = {
        enable = true,
        options = {}, -- here you can configure namu
      },
      -- Optional: Enable other modules if needed
      ui_select = { enable = false }, -- vim.ui.select() wrapper
      colorscheme = {
        enable = false,
        options = {
          -- NOTE: if you activate persist, then please remove any vim.cmd("colorscheme ...") in your config, no needed anymore
          persist = true, -- very efficient mechanism to Remember selected colorscheme
          write_shada = false, -- If you open multiple nvim instances, then probably you need to enable this
        },
      },
    },
  },
  {
    "retran/meow.yarn.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "MeowYarn",
    opts = {},
  },
}
