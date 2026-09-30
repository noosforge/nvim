return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
    })

    local builtin = require("telescope.builtin")
    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })

    -- switch colorscheme live: arrow keys preview, <CR> to keep
    keymap.set("n", "<leader>th", function()
      builtin.colorscheme({ enable_preview = true })
    end, { desc = "Switch colorscheme" })
  end,
}
