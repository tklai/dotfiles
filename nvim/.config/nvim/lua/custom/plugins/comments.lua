return {
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o", "x" }, desc = "Comment toggle selection" },
    },
    opts = {
      mappings = {
        extra = false,
      },
    },
  },
}
