local present, telescope = pcall(require, "telescope")
if not present then
  return
end

local telescope_extensions = {
  "media_files",
  "project",
}

for _, v in ipairs(telescope_extensions) do
  telescope.load_extension(v)
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
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg",
    },
    project = {
      base_dirs = {
        "~/Projects",
      },
    },
  },
})

local telescope_builtin = require("telescope.builtin")
local opts = { noremap = true, silent = true }
-- Global Files
vim.keymap.set("n", "<C-p>", telescope_builtin.find_files, opts)
vim.keymap.set("n", "<leader>ff", function()
  telescope_builtin.find_files({ find_command = { "rg", "-i", "--files", "-g", "!.git" } })
end, opts)
-- Find specific string in working directory (Global search)
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, opts)
-- Find the string under the cursor in working directory and filter the result (Scoped Search)
vim.keymap.set("n", "<leader>fs", telescope_builtin.grep_string, opts)
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, opts)
vim.keymap.set("n", "<leader>fp", telescope.extensions.project.project, opts)
vim.keymap.set("n", "<leader>vh", telescope_builtin.help_tags, opts)
