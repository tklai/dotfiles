local flexoki = vim.F.npcall(require, "flexoki")
if not flexoki then
  return
end

vim.cmd.colorscheme("flexoki-light")
