local lspconfig = vim.F.npcall(require, "lspconfig")
if not lspconfig then
  return {}
end

local schemastore = vim.F.npcall(require, "schemastore")

local config = {}

config.eslint = {
  root_dir = lspconfig.util.root_pattern(
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json"
  ),
}

config.jsonls = {
  settings = {
    json = {
      --
    },
  },
}

if schemastore then
  config.jsonls.settings.json = {
    schemas = schemastore.json.schemas(),
    validate = {
      enable = true,
    },
  }
end

config.sumneko_lua = {
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
}

config.vuels = {
  init_options = {
    config = {
      vetur = {
        ignoreProjectWarning = true,
      },
    },
  },
}

return config
