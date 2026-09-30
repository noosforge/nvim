return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      compile = false,
      transparent = false,
      theme = "dragon",
    })
    vim.cmd("colorscheme kanagawa-dragon")
  end,
}
