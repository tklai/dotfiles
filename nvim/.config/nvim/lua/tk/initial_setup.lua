local reload_required = false

local setup_packer = function()
  local packer_path = string.format("%s/site/pack/packer/start/packer.nvim", vim.fn.stdpath("data"))
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

if not vim.F.npcall(require, "packer") then
  reload_required = true
  setup_packer()
end

return reload_required
