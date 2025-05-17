return {
  "mfussenegger/nvim-dap",
  -- enabled = false,
  event = "VeryLazy",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "williamboman/mason.nvim",
    {
      "miroshQa/debugmaster.nvim",
      config = function()
        local dm = require("debugmaster")

        vim.keymap.set({ "n", "v" }, ";d", dm.mode.toggle, { nowait = true })
        vim.keymap.set("t", "<C-/>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
      end,
    },
  },
  config = function()
    local dap = require("dap")

    require("nvim-dap-virtual-text").setup()

    vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
    vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

    -- vim.keymap.set("n", "<F1>", dap.step_into)
    -- vim.keymap.set("n", "<F2>", dap.step_over)
    -- vim.keymap.set("n", "<F3>", dap.step_out)
    -- vim.keymap.set("n", "<F4>", dap.step_back)
    -- vim.keymap.set("n", "<F5>", dap.continue)
    -- vim.keymap.set("n", "<C-S-F5>", dap.restart)

    -- Languages
    local php_debug_adapter = vim.fn.exepath("php-debug-adapter")
    if php_debug_adapter ~= "" then
      dap.adapters.php = {
        type = "executable",
        command = php_debug_adapter,
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug (Workspace)",
          port = 9000,
          ignore = {
            "**/vendor/**/*.php",
          },
          skipFiles = {
            "**/vendor/**",
          },
          pathMappings = {
            ["/var/www"] = "${workspaceFolder}/../../project",
          },
        },
      }
    end
  end,
}
