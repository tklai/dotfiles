return {
  {
    "danymat/neogen",
    event = "VeryLazy",
    keys = {
      {
        "<leader>aa",
        function()
          require("neogen").generate()
        end,
        desc = "Neogen Comment",
      },
    },
    opts = { snippet_engine = "nvim" },
  },
}
