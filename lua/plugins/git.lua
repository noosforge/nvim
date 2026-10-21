return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      -- gitsigns
      require("gitsigns").setup({
        signs = {
          add          = { text = "│" },
          change       = { text = "│" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
        },

        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation between hunks (changes)
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true, desc = "Next git hunk" })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true, desc = "Previous git hunk" })

          -- Actions
          map('n', '<leader>gs', gs.stage_hunk, { desc = "Stage hunk" })
          map('n', '<leader>gr', gs.reset_hunk, { desc = "Reset hunk" })
          map('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
            { desc = "Stage selected hunk" })
          map('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
            { desc = "Reset selected hunk" })

          -- Preview
          map('n', '<leader>gp', gs.preview_hunk, { desc = "Preview hunk" })

          -- Blame
          map('n', '<leader>gb', function() gs.blame_line { full = true } end, { desc = "Blame line" })
        end,
      })
    end,
  },

  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" }
    }
  },
}
