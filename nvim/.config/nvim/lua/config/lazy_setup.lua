local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  vim.notify("lazy.nvim cannot be found or loaded", vim.log.levels.INFO)

  -- Remove the folder / file before cloning
  vim.fn.delete(lazy_path, "rf")

  vim.notify("Cloning lazy.nvim to " .. lazy_path .. "...", vim.log.levels.INFO)
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazy_path,
  })
end

vim.opt.runtimepath:prepend(lazy_path)

require("lazy").setup({
  defaults = { lazy = true },
  spec = {
    { import = "custom.plugins" },
    { import = "custom.languages" },
    { import = "custom.colorschemes" },
  },
  change_detection = { notify = false },
  ui = { border = "rounded" },
  profiling = {
    loader = false,
    require = false,
  },
  rocks = { enabled = false },
  pkg = {
    sources = { "lazy" },
  },
  performance = {
    rtp = {
      disabled_plugins = {
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
      },
    },
  },
})
