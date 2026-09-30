return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto", -- follows whatever colorscheme is active, incl. all kanagawa/tokyonight/etc variants
      },
    })
  end,
}
