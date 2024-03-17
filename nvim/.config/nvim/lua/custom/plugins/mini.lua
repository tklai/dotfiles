return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.surround').setup({
        mappings = {
          add = 'ra',
          delete = 'rd',
          find = '',
          find_left = '',
          highlight = 'rh',
          replace = 'rr',
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
