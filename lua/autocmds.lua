-- Reload any open buffer that changed on disk (e.g. Claude Code editing files
-- in another pane) as soon as the cursor moves, without waiting for
-- FocusGained/BufEnter. `:checktime` with no argument checks ALL loaded
-- buffers, not just the current one, so background/hidden buffers pick up
-- external changes too.
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI", "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "if mode() != 'c' | checktime | endif",
})

-- checktime reloads silently when the buffer has no unsaved local edits, so
-- without this you'd never know a background file just changed under you.
-- (If the buffer DOES have unsaved edits, Vim shows its own W12 conflict
-- prompt instead of firing this event, so this only fires for clean reloads.)
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  callback = function(args)
    vim.notify("Reloaded from disk: " .. vim.fn.fnamemodify(args.file, ":."), vim.log.levels.INFO)
  end,
})
