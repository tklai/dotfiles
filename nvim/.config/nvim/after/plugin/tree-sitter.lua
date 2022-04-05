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

local config = {
    ensure_installed = languages,
}

local orgmode_present, orgmode = pcall(require, "orgmode")
if orgmode_present then
    orgmode.setup_ts_grammar()

    config.highlight = vim.tbl_extend("force", config.highlight or {}, {
        enable = true,
        disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
        additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
    })
end

treesitter_config.setup(config)
