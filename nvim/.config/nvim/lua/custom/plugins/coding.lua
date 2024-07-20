return {
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>aa",
        function()
          require("neogen").generate()
        end,
        desc = "Neogen Comment",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },
}
