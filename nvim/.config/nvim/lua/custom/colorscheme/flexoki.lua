local flexoki = vim.F.npcall(require, "flexoki")
if not flexoki then
  return
end

flexoki.setup({
  variant = 'light',
})

vim.cmd.colorscheme("flexoki-light")
