local config = {
  settings = {
    yaml = {},
  },
}

local schemastore = vim.F.npcall(require, "schemastore")
if schemastore then
  config = vim.tbl_extend("force", config.settings.yaml, {
    schemaStore = {
      enable = false,
      url = "",
    },
    schemas = require("schemastore").yaml.schemas(),
  })
end

return config
