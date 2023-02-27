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

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.dbml = {
--   install_info = {
--     url = "~/Workspace/personal/tree-sitter-dbml", -- local path or git repo
--     files = { "src/parser.c" },
--     branch = "main", -- default branch in case of git repo if different from master
--   },
--   filetype = "dbml", -- if filetype does not match the parser name
-- }
