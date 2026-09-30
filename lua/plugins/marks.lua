-- shows your marks (native vim: press m{a-z} to set one, `{a-z} to jump back)
-- in the sign column, so you actually start using one of vim's most-ignored features
return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  config = function()
    require("marks").setup({})
  end,
}
