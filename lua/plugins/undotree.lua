-- visualizes Vim's own branching undo history as a tree you can navigate
-- and jump to any past state, not just the linear undo/redo you get by default
return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  config = function()
    vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle undo tree" })
  end,
}
