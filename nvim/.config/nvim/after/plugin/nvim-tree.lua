local present, nvim_tree = pcall(require, "nvim-tree")
if not present then
  return
end

nvim_tree.setup({
  auto_close = true,
  update_cwd = true,
  view = {
    width = 50,
    side = "right",
  },
})

vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { noremap = true })
