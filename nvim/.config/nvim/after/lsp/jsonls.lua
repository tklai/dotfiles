local config = {
  settings = {
    json = {},
  },
}

local schemastore = vim.F.npcall(require, "schemastore")
if schemastore then
  config = vim.tbl_extend("force", config.settings.json, {
    schemas = schemastore.json.schemas(),
    validate = { enable = true },
  })
end

return config
