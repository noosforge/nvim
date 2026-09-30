return {
  "akinsho/toggleterm.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("toggleterm").setup({
      direction = "float",
      float_opts = { border = "rounded" },
      close_on_exit = false, -- keep the process alive when hidden
    })

    local Terminal = require("toggleterm.terminal").Terminal

    -- our own registry: id -> { term = <Terminal>, name = <string> }
    -- toggleterm has no built-in name/MRU concept, so we track both ourselves
    local terminals = {}
    local last_used_id = nil

    -- keeps the floating window's title in sync with the current name,
    -- including after a rename (title is re-read each time it's (re)opened)
    local function sync_title(entry)
      entry.term.float_opts = vim.tbl_extend("force", entry.term.float_opts or {}, {
        title = entry.name,
        title_pos = "left",
      })
    end

    local function new_terminal(name)
      local term = Terminal:new({
        direction = "float",
        float_opts = { border = "rounded", title = name, title_pos = "left" },
        on_open = function(t)
          vim.api.nvim_buf_set_var(t.bufnr, "my_term_id", t.id)
        end,
      })
      terminals[term.id] = { term = term, name = name }
      last_used_id = term.id
      term:open()
    end

    local function prompt_new_terminal()
      vim.ui.input({ prompt = "Name this terminal: " }, function(input)
        if input and input ~= "" then
          new_terminal(input)
        end
      end)
    end

    -- <C-\> with no count: toggle whichever terminal you used last (create one, first time)
    -- <N><C-\>: jump straight to the Nth terminal you created, by creation order
    local function toggle_smart()
      if vim.v.count == 0 then
        if last_used_id and terminals[last_used_id] then
          sync_title(terminals[last_used_id])
          terminals[last_used_id].term:toggle()
        else
          prompt_new_terminal()
        end
        return
      end

      local ids = {}
      for id in pairs(terminals) do
        table.insert(ids, id)
      end
      table.sort(ids)

      local target = ids[vim.v.count]
      if target then
        last_used_id = target
        sync_title(terminals[target])
        terminals[target].term:toggle()
      else
        vim.notify("No terminal #" .. vim.v.count .. " yet", vim.log.levels.WARN)
      end
    end

    -- flips the CURRENTLY FOCUSED terminal between floating and a right-side vertical split
    local function toggle_position()
      local id = vim.b.my_term_id
      if not id or not terminals[id] then
        vim.notify("Not inside a managed terminal", vim.log.levels.WARN)
        return
      end
      local entry = terminals[id]
      local new_direction = entry.term.direction == "float" and "vertical" or "float"
      sync_title(entry)
      entry.term:close()
      entry.term:open(nil, new_direction)
    end

    local function terminal_picker()
      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local conf = require("telescope.config").values
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      local function entries()
        local list = {}
        for id, entry in pairs(terminals) do
          table.insert(list, { id = id, name = entry.name })
        end
        table.sort(list, function(a, b) return a.id < b.id end)
        return list
      end

      pickers.new({}, {
        prompt_title = "Terminals (<C-r> rename, <C-d> delete)",
        finder = finders.new_table({
          results = entries(),
          entry_maker = function(e)
            return {
              value = e.id,
              display = string.format("[%d] %s", e.id, e.name),
              ordinal = e.name,
            }
          end,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
          actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            if selection then
              last_used_id = selection.value
              sync_title(terminals[selection.value])
              terminals[selection.value].term:open()
            end
          end)

          map({ "i", "n" }, "<C-r>", function()
            local selection = action_state.get_selected_entry()
            if not selection then return end
            actions.close(prompt_bufnr)
            vim.ui.input({ prompt = "Rename to: " }, function(input)
              if input and input ~= "" then
                terminals[selection.value].name = input
              end
            end)
          end)

          map({ "i", "n" }, "<C-d>", function()
            local selection = action_state.get_selected_entry()
            if not selection then return end
            terminals[selection.value].term:shutdown()
            terminals[selection.value] = nil
            actions.close(prompt_bufnr)
          end)

          return true
        end,
      }):find()
    end

    local keymap = vim.keymap
    keymap.set({ "n", "t" }, "<C-\\>", toggle_smart, { desc = "Toggle terminal (or [count]<C-\\> to jump to Nth)" })
    keymap.set("n", "<leader>tn", prompt_new_terminal, { desc = "New named terminal" })
    keymap.set("n", "<leader>tt", terminal_picker, { desc = "List/jump/rename/delete terminals" })
    keymap.set("n", "<leader>tv", toggle_position, { desc = "Toggle terminal float/right-split" })
  end,
}
