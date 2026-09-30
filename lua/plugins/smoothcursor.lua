return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = {
    -- "none" makes the smear use your current cursor highlight color instead of a fixed one.
    cursor_color = "none",
    -- Lower = more elastic/stretchy smear, higher = snappier/stiffer.
    stiffness = 0.8,
    trailing_stiffness = 0.5,
    -- Moves smaller than this just snap instead of animating (skips j/k noise).
    distance_stop_animating = 0.5,
    -- Keep the smear contained to the current window/buffer, not across splits.
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
  },
}
