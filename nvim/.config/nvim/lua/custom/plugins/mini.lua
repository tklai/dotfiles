return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.surround').setup({
        mappings = {
          add = '<C-r>a',
          delete = '<C-r>d',
          find = '',
          find_left = '',
          highlight = '<C-r>h',
          replace = '<C-r>r',
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
