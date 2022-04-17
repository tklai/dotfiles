require("nvim-treesitter.configs").setup({
  ensure_installed = {
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
  },
})
