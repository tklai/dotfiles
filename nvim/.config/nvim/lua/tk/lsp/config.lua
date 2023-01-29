local lspconfig = vim.F.npcall(require, "lspconfig")
if not lspconfig then
  return {}
end

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

local schemastore = vim.F.npcall(require, "schemastore")
if schemastore then
  config.jsonls = vim.tbl_extend("force", config.jsonls.settings.json, {
    schemas = schemastore.json.schemas(),
    validate = {
      enable = true,
    },
  })
end

-- TODO: Can I store the exclude list in a private file or .env?
config.intelephense = {
  settings = {
    intelephense = {
      files = {
        exclude = {
          "**/.git/**",
          "**/node_modules/**",
          "**/bower_components/**",
          "**/vendor/**/{Tests,tests}/**",
          "**/vendor/**/vendor/**",
        }
      },
    },
  },
}

config.phpactor = {
  init_options = {
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = false,
  }
}

config.sumneko_lua = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
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
