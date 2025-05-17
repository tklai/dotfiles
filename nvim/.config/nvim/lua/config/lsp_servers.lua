local config = {}

config.eslint = {
  root_dir = require("lspconfig").util.root_pattern(
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

config.yamlls = {
  settings = {
    yaml = {
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

  config.yamlls = vim.tbl_extend("force", config.yamlls.settings.yaml, {
    schemaStore = {
      enable = false,
      url = "",
    },
    schemas = require('schemastore').yaml.schemas(),
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
        },
      },
    },
  },
}

config.phpactor = {
  init_options = {
    ["language_server_phpstan.enabled"] = true,
    ["language_server_psalm.enabled"] = false,
    ["language_server_worse_reflection.inlay_hints.enable"] = false,
    ["indexer.exclude_patterns"] = {
      "/vendor/**/Tests/**/*",
      "/vendor/**/tests/**/*",
      "/vendor/composer/**/*",
    },
    ["symfony.enabled"] = true,
  },
}

config.lua_ls = {
  settings = {
    Lua = {
      telemetry = { enable = false },
      completion = {
        workspaceWord = true,
        callSnippet = "Replace",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
      format = {
        enable = false,
      },
      hint = {
        enable = true,
      },
    },
  },
}

config.ts_ls = {
  init_options = {
    preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
      importModuleSpecifierPreference = "non-relative",
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
