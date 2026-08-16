return {
  {
    'nvim-mini/mini.nvim',
    version = false,
    event = "VeryLazy",
    config = function()
      require('mini.splitjoin').setup({
        mappings = { toggle = '<leader>m' },
      })
      require('mini.surround').setup({
        mappings = {
          add = '<leader>sa',
          delete = '<leader>sd',
          find = '',
          find_left = '',
          highlight = '<leader>sh',
          replace = '<leader>sr',
          update_n_lines = '',

          suffix_last = '',
          suffix_next = '',
        },
      })
    end,
  },
}
