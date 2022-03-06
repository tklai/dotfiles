local present, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not present then
  return
end

local languages = {
  -- Styles
  "css",
  "scss",
  -- JS / TS
  "javascript",
  "tsx",
  "typescript",
  -- Framework
  "svelte",
  "vue",
  -- Web
  "html",
  "http",
  "php",
  --"phpdoc", -- Cannot be installed in ARM64 ;(
  "jsdoc",
  "json",
  "json5",
  "jsonc",
  -- Utilities
  "bash",
  "comment",
  "dockerfile",
  "lua",
  "regex",
  "toml",
  "yaml",
}

treesitter_config.setup({
  ensure_installed = languages,
})
