return {
  { "mfussenegger/nvim-dap" },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function()
      require("flutter-tools").setup({
        debugger = {
          enabled = true,
          run_via_dap = false,
          register_configurations = function(_)
            local dart_debug_adapter = vim.fn.exepath("dart-debug-adapter")
            if dart_debug_adapter ~= "" then
              require("dap").adapters.dart = {
                type = "executable",
                command = dart_debug_adapter,
                args = { "flutter" },
              }

              require("dap").configurations.dart = {
                {
                  type = "dart",
                  request = "launch",
                  name = "Launch flutter",
                  dartSdkPath = "home/flutter/bin/cache/dart-sdk/",
                  flutterSdkPath = "home/flutter",
                  program = "${workspaceFolder}/lib/main.dart",
                  cwd = "${workspaceFolder}",
                },
              }
            end
          end,
        },
        dev_log = {
          enabled = false,
          open_cmd = "tabedit",
        },
      })
    end,
  },
  {
    "dart-lang/dart-vim-plugin",
  },
}
