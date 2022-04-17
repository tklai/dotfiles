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
      prompt_position = "top",
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

local keymap = require("tk.utils").keymap
local telescope_builtin = require("telescope.builtin")

-- Global Files
keymap("n", "<C-p>", telescope_builtin.find_files)
keymap("n", "<leader>ff", function()
  telescope_builtin.find_files({ find_command = { "rg", "-i", "--files", "-g", "!.git" } })
end)
-- Find specific string in working directory (Global search)
keymap("n", "<leader>fg", telescope_builtin.live_grep)
-- Find the string under the cursor in working directory and filter the result (Scoped Search)
keymap("n", "<leader>fs", telescope_builtin.grep_string)
keymap("n", "<leader>fb", telescope_builtin.buffers)
keymap("n", "<leader>vh", telescope_builtin.help_tags)
