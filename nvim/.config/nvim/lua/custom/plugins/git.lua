return {
  {
    "TimUntersberger/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Neogit",
    init = function()
      require("tk.utils.keymap").nnoremap("<leader>vc", require("neogit").open)
    end,
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local keymap = require("tk.utils.keymap")

        keymap.nnoremap("]h", gs.next_hunk, { desc = "Next Hunk" })
        keymap.nnoremap("[h", gs.prev_hunk, { desc = "Prev Hunk" })
        keymap.nnoremap("<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
        keymap.vnoremap("<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
        keymap.nnoremap("<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
        keymap.vnoremap("<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
        keymap.nnoremap("<leader>ghS", gs.stage_buffer, { desc = "Stage Buffer" })
        keymap.nnoremap("<leader>ghu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
        keymap.nnoremap("<leader>ghR", gs.reset_buffer, { desc = "Reset Buffer" })
        keymap.nnoremap("<leader>ghp", gs.preview_hunk, { desc = "Preview Hunk" })
      end,
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
