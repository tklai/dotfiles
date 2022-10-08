local schemastore = vim.F.npcall(require, "schemastore")

local config = {}

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

return config
