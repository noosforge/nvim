return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" },
    },
    "theHamsta/nvim-dap-virtual-text", -- shows variable values as inline ghost text while stepping
    -- lets Mason install debug adapters (like it does language servers)
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- no docked sidebar/bottom panels at all — everything is a popup you summon on demand
    dapui.setup({
      layouts = {},
      floating = {
        max_height = 0.9,
        max_width = 0.9,
        border = "rounded",
        mappings = { close = { "q", "<Esc>" } },
      },
    })

    require("nvim-dap-virtual-text").setup({})

    require("mason-nvim-dap").setup({
      automatic_installation = true,
      ensure_installed = { "codelldb" },
      handlers = {},
    })

    -- codelldb launch config for C (and C++, since it's the same adapter):
    -- prompts for the built binary each time rather than hardcoding a path
    local c_config = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }
    dap.configurations.c = c_config
    dap.configurations.cpp = c_config

    -- auto-pop the console (program output / REPL) when a session starts,
    -- and clean up every dapui window (floating or not) when it ends
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.float_element("console", { enter = false })
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    local keymap = vim.keymap
    keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue / start debugging" })
    keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
    keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
    keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step out" })
    keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open native debug REPL" })
    keymap.set("n", "<leader>dt", dap.terminate, { desc = "Terminate debug session" })

    -- floating inspection panels, each opened on demand
    keymap.set("n", "<leader>ds", function() dapui.float_element("scopes") end, { desc = "Float: scopes" })
    keymap.set("n", "<leader>dw", function() dapui.float_element("watches") end, { desc = "Float: watches" })
    keymap.set("n", "<leader>df", function() dapui.float_element("stacks") end, { desc = "Float: call stack" })
    keymap.set("n", "<leader>dp", function() dapui.float_element("breakpoints") end, { desc = "Float: breakpoints panel" })
    keymap.set("n", "<leader>du", function() dapui.float_element("console") end, { desc = "Float: console/output" })
  end,
}
