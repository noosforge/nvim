-- Fixes "Undefined global `vim`" and similar false-positive diagnostics
-- when lua_ls lints your own Neovim config files.
return {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {},
}
