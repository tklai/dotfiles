local telescope = require("telescope")

local telescope_extensions = {
  "media_files",
}

for _, name in pairs(telescope_extensions) do
  telescope.load_extension(name)
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
  },
  extensions = {
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
nnoremap("<leader>ff", function()
  telescope_builtin.find_files({ find_command = { "rg", "-i", "--files", "-g", "!.git" } })
end)
-- Find specific string in working directory (Global search)
nnoremap("<leader>fg", telescope_builtin.live_grep)
-- Find the string under the cursor in working directory and filter the result (Scoped Search)
nnoremap("<leader>fs", telescope_builtin.grep_string)
nnoremap("<leader>fb", telescope_builtin.buffers)
nnoremap("<leader>vh", telescope_builtin.help_tags)
