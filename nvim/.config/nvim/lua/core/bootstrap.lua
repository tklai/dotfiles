local reload_required = false

-- Package Manager
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  print("lazy.nvim was not existed or loaded")

  -- Remove the folder / file before cloning
  vim.fn.delete(lazy_path, "rf")

  print(string.format("Cloning lazy.nvim to '%s'...", lazy_path))
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazy_path,
  })

  reload_required = true
end

vim.opt.runtimepath:prepend(lazy_path)

return reload_required
