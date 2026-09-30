-- ys{motion}{char} add surround, cs{old}{new} change, ds{char} delete, S{char} in visual
return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {
      surrounds = {
        -- generic, dynamic surround: prompts you to TYPE the left/right text
        -- live, so it works for anything — """, --[[ ]], /* */, a whole word...
        ["i"] = {
          add = function()
            local left = vim.fn.input("Left surround: ")
            local right = vim.fn.input("Right surround: ")
            return { { left }, { right } }
          end,
        },
      },
    },
  },
  "tpope/vim-repeat", -- makes `.` repeat surround changes too, not just native edits
}
