return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
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

      require('mini.statusline').setup({
        -- Prevent mini overwriting the settings
        set_vim_settings = false,
      })
    end,
  },
}
