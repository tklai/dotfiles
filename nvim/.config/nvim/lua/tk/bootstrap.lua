local reload_required = false
local packer_path = string.format("%s/site/pack/packer/start/packer.nvim", vim.fn.stdpath("data"))

local setup_packer = function()
  reload_required = true

  local packer_repo = "https://github.com/wbthomason/packer.nvim"

  print(string.format("Cloning packer to '%s'...", packer_path))

  -- Remove the folder / file before cloning
  vim.fn.delete(packer_path, "rf")
  vim.fn.system(string.format("git clone %s %s", packer_repo, packer_path))

  local installed, err = pcall(vim.cmd, "packadd packer.nvim")
  if not installed then
    print(string.format("Something wrong when cloning packer.nvim to '%s'.\n", packer_path))
    error("Error:\n" .. err)
  end

  print("Packer Cloned Successfully.")
end

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  setup_packer()
end

if not reload_required and not vim.F.npcall(require, "packer") then
  reload_required = true

  error(
    string.format(
      "packer.nvim is corrupted and cannot be loaded."
      .. "\nPlease delete packer.nvim from the path and reload neovim."
      .. "\nPath: %s",
      packer_path
    )
  )
end

return reload_required
