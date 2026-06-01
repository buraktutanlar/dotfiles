-- DAP (Debug Adapter Protocol) configuration
-- Supports debugging for Go (delve), Python (debugpy), and Node.js

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap = require("dap")

      require("dap-go").setup()
      require("dap-python").setup("python")

      -- Node.js debugging
      dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
      }

      dap.configurations.javascript = {
        {
          name = "Launch",
          type = "node2",
          request = "launch",
          program = "${workspaceFolder}/${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          console = "integratedTerminal",
        },
      }

      dap.configurations.typescript = dap.configurations.javascript

      -- Keybindings
      vim.keymap.set("n", "<F5>", dap.continue, { noremap = true, silent = true })
      vim.keymap.set("n", "<F10>", dap.step_over, { noremap = true, silent = true })
      vim.keymap.set("n", "<F11>", dap.step_into, { noremap = true, silent = true })
      vim.keymap.set("n", "<F12>", dap.step_out, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { noremap = true, silent = true })
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dapui = require("dapui")
      local dap = require("dap")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      vim.keymap.set("n", "<leader>du", dapui.toggle, { noremap = true, silent = true })
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
}
