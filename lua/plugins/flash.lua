-- press `s` then 1-2 chars: jump anywhere visible on screen instantly.
-- `S` does the same but snaps to treesitter nodes (functions, blocks, etc).
-- this replaces vim's native `s` (substitute-char), which almost nobody uses.
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash jump" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter select" },
  },
}
