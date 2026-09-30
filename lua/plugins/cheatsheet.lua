-- The searchable "nvim bible" popup: press <leader>? then either
--   - type any word ("flash", "window", "debug"...) to fuzzy-find a key, or
--   - press a category shortcut (Shift+letter, lazy.nvim style) to land
--     on exactly that section, nothing else — like lazy.nvim's I/U/S/C tabs.
--     `A` goes back to the full list, `i` to type, `?` for the shortcut
--     list, <Esc>/q to close.
-- Content lives in lua/cheatsheet_data.lua — same source used for CHEATSHEET.md.

-- One Shift+letter per category. Kept collision-free with Telescope's own
-- normal-mode defaults (H/M/L/G = move top/middle/bottom/end, j/k = up/down,
-- i/a/o = enter insert, ? = show this list). `A` is reserved for "back to All".
local CATEGORY_KEYS = {
  B = "Basics",
  V = "Modes",
  N = "Navigation",
  S = "Search",
  W = "Windows",
  E = "Editing",
  O = "Text objects",
  U = "Buffers",
  F = "File explorer",
  P = "Telescope",
  K = "LSP",
  R = "Formatting",
  D = "Debugger",
  T = "Terminal",
  C = "Claude",
  Z = "C/C++",
}

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>?",
      function()
        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local conf = require("telescope.config").values
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        local entries = require("cheatsheet_data")

        local entry_maker = function(e)
          return {
            value = e,
            display = string.format("%-14s %-28s %s", e.category, e.keys, e.desc),
            ordinal = e.category .. " " .. e.keys .. " " .. e.desc,
          }
        end

        local function entries_for(category)
          if not category then
            return entries
          end
          local filtered = {}
          for _, e in ipairs(entries) do
            if e.category == category then
              table.insert(filtered, e)
            end
          end
          return filtered
        end

        pickers.new({}, {
          prompt_title = "Nvim Bible — press a category letter, `A` for all, `i` to type",
          initial_mode = "normal",
          finder = finders.new_table({
            results = entries,
            entry_maker = entry_maker,
          }),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
              actions.close(prompt_bufnr)
            end)

            local function jump_to(category)
              local picker = action_state.get_current_picker(prompt_bufnr)
              picker:refresh(
                finders.new_table({ results = entries_for(category), entry_maker = entry_maker }),
                { reset_prompt = true }
              )
            end

            for key, category in pairs(CATEGORY_KEYS) do
              map("n", key, function()
                jump_to(category)
              end, { desc = "Jump to category: " .. category })
            end

            map("n", "A", function()
              jump_to(nil)
            end, { desc = "Back to: All categories" })

            return true
          end,
        }):find()
      end,
      desc = "Open the cheatsheet (search all keymaps)",
    },
  },
}
