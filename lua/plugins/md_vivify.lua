return {
  {
    "jannis-baum/vivify.vim",
    cmd = { "Vivify" },
    ft = { "markdown" },

    -- Optional: You can set Vivify's configuration variables here
    init = function()
      -- These are the default values; change them if you want.
      vim.g.vivify_instant_refresh = 1
      vim.g.vivify_auto_scroll = 1
    end,

    config = function()
      vim.keymap.set("n", "<leader>mp", "<cmd>Vivify<CR>", { desc = "Markdown preview with Vivify" })
    end
  },
}
