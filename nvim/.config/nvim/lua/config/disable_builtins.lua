local builtin_plugins_to_disable = {
  "getscript",
  "getscriptPlugin",
  "2html_plugin",
  "logipat",
  -- "matchit",
  "rrhelper",
  "spellfile_plugin",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "perl_provider",
  "python_provider",
  "python3_provider",
  "ruby_provider",
  "gzip",
  "tar",
  "tarPlugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(builtin_plugins_to_disable) do
  vim.g["loaded_" .. plugin] = 1
end
