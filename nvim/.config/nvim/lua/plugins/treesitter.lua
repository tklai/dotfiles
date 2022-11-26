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
    --"phpdoc", -- Cannot be installed on ARM64 ;(
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
  highlight = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["ip"] = "@parameter.inner",
      },
    },
  },
})

require("treesitter-context").setup({})
