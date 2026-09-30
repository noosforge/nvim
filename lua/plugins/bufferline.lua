--[[
--return {
  "akinsho/bufferline.nvim",
  enabled = false, -- flip to true (or delete this line) to bring it back
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
      },
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer/tab" })
    keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer/tab" })
    keymap.set("n", "<leader>bx", "<cmd>bdelete<CR>", { desc = "Close buffer/tab" })
  end,
}
]]
return {}
