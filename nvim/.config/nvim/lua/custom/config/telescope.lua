local telescope = require("telescope")

local telescope_extensions = {
  "fzf",
  "media_files",
}

for _, name in pairs(telescope_extensions) do
  telescope.load_extension(name)
end

local previewers = require("telescope.previewers")

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then
      return
    end
    local max_size = 256000
    if stat.size > max_size then
      vim.schedule_wrap(require("telescope.previewers.utils").set_preview_message)(
        bufnr,
        opts.winid,
        string.format("File size exceeds %d KB", max_size / 1024),
        vim.F.if_nil(opts.preview and opts.preview.msg_bg_fillchar or nil, "╱")
      )
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

telescope.setup({
  defaults = {
    layout_strategy = "flex",
    layout_config = {
      horizontal = {
        preview_width = 0.4,
      },
      width = 0.9,
      height = 0.9,
      preview_cutoff = 120,
    },
    buffer_previewer_maker = new_maker,
    file_ignore_patterns = {
      "public/",
    },
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        },
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    media_files = {
      filetypes = {
        "png",
        "webp",
        "jpg",
        "jpeg",
      },
      find_cmd = "rg",
    },
  },
})

local Keymap = require("tk.utils.keymap")
local nnoremap = Keymap.nnoremap

local telescope_builtin = require("telescope.builtin")

-- Global Files
nnoremap("<C-p>", telescope_builtin.find_files)
-- Find specific string in working directory (Global search)
nnoremap("<C-/>", telescope_builtin.live_grep)
-- Find the string under the cursor in working directory and filter the result (Scoped Search)
nnoremap("<leader>fs", telescope_builtin.grep_string)
nnoremap("<leader>fb", telescope_builtin.buffers)
nnoremap("<leader>vh", telescope_builtin.help_tags)
nnoremap("<leader>ds", telescope_builtin.lsp_document_symbols)
