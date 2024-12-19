return {
  {
    "ibhagwan/fzf-lua",
    enabled = false,
    keys = {
      {
        "<leader><leader>",
        function()
          require("fzf-lua").files()
        end,
      },
    },
    config = function()
      require("fzf-lua").setup({
        winopts = {
          border = "none",
          row = 1,
          col = 0,
          width = 1,
          height = 0.3,
          backdrop = 100,
          preview = {
            title = false,
          },
        },
      })
    end,
  },
}
