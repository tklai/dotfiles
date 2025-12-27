local tsserver_filetypes = {
  'typescript',
  'javascript',
  'javascriptreact',
  'typescriptreact',
  'vue',
}

local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
  languages = { 'vue' },
  configNamespace = 'typescript',
}

return {
  filetypes = tsserver_filetypes,
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
}
