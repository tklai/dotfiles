return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      -- Sources
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          require("cmp_tabnine.config"):setup({
            max_lines = 1000,
            max_num_results = 20,
            sort = true,
            run_on_every_keystroke = true,
            snippet_placeholder = "..",
            ignored_file_types = {
              TelescopePrompt = true,
              NvimTree = true,
            },
            show_prediction_strength = false,
          })
        end,
      },
      -- Default Snippets
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("custom.config.completion")
    end,
  },
}
