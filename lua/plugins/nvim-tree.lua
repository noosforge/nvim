return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      -- Make ignored files VISIBLE (dimmed) instead of hidden
      filters = {
        git_ignored = false, -- show gitignored files
      },

      -- Dimming and icons
      renderer = {
        highlight_git = "all",
        highlight_opened_files = "none",
        icons = {
          git_placement = "after", -- or "after", "signcolumn"
          glyphs = {
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },

      -- Git integration (enable/disable)
      git = {
        enable = true,
        show_on_dirs = true,
      },

      view = {
        adaptive_size = true,
      },
    })

    vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>",
      { desc = "Toggle file explorer on current file" })

    -- Move the "NvimTree_1 [-]" label lualine draws at the bottom of the tree
    -- window up into a winbar instead, and blank the bottom one so it's not duplicated.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "NvimTree",
      callback = function()
        vim.opt_local.winbar = "%f%m"
        vim.opt_local.statusline = " "
      end,
    })
  end,
}
