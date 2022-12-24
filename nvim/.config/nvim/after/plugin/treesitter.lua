require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "comment",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "php",
    "regex",
    "scss",
    "tsx",
    "typescript",
    "vim",
  },
  auto_install = true,
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
