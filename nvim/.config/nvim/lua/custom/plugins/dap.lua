return {
  "mfussenegger/nvim-dap",
  enabled = false,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "williamboman/mason.nvim",
  },
  config = function()
    local dap = require("dap")
    local ui = require("dapui")

    ui.setup()
    require("nvim-dap-virtual-text").setup()

    vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
    vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

    vim.keymap.set("n", "<space>?", function()
      ui.eval(nil, { enter = true })
    end)

    vim.keymap.set("n", "<F1>", dap.step_into)
    vim.keymap.set("n", "<F2>", dap.step_over)
    vim.keymap.set("n", "<F3>", dap.step_out)
    vim.keymap.set("n", "<F4>", dap.step_back)
    vim.keymap.set("n", "<F5>", dap.continue)
    vim.keymap.set("n", "<F13>", dap.restart)

    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end

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
            ["/var/www"] = "${workspaceFolder}/../../../projects",
          },
        },
      }
    end
  end,
}
