-- Single source of truth for both the searchable <leader>? picker and CHEATSHEET.md.
-- Keep this updated when keymaps change — everything else reads from here.
return {
  -- Basics
  { category = "Basics", keys = "<Space>", desc = "Leader key" },
  { category = "Basics", keys = "yy / p", desc = "Yank/paste now syncs with system clipboard (clipboard=unnamedplus)" },
  { category = "Basics", keys = "<leader>nh", desc = "Clear search highlights" },
  { category = "Basics", keys = "<leader>w", desc = "Save file" },
  { category = "Basics", keys = "<leader>q", desc = "Quit window" },
  { category = "Basics", keys = ":e {filename}", desc = "Create/open a file (written to disk on :w) — treesitter is unrelated to file creation" },
  { category = "Basics", keys = ":vs {filename} / :sp {filename}", desc = "Create/open a file in a new vertical/horizontal split" },
  { category = "Basics", keys = ":w", desc = "Save file (native — <leader>w above also runs this)" },
  { category = "Basics", keys = ":q", desc = "Quit window" },
  { category = "Basics", keys = ":wq / :x", desc = "Save and quit (:x only writes if there are changes)" },
  { category = "Basics", keys = ":q!", desc = "Quit without saving" },
  { category = "Basics", keys = ":e!", desc = "Reload file from disk, discarding unsaved changes" },

  -- Modes
  { category = "Modes", keys = "i / a", desc = "Insert before / after the cursor" },
  { category = "Modes", keys = "I / A", desc = "Insert at start / end of the line" },
  { category = "Modes", keys = "o / O", desc = "Open a new line below / above and insert" },
  { category = "Modes", keys = "<Esc> / <C-c>", desc = "Back to normal mode" },
  { category = "Modes", keys = "v / V / <C-v>", desc = "Visual (char) / visual line / visual block" },
  { category = "Modes", keys = "gv", desc = "Reselect the last visual selection" },

  -- Navigation
  { category = "Navigation", keys = "0 / ^ / $", desc = "Start of line / first non-blank char / end of line" },
  { category = "Navigation", keys = "w / b / e", desc = "Next word / back a word / end of word" },
  { category = "Navigation", keys = "gg / G", desc = "Top / bottom of file" },
  { category = "Navigation", keys = "{N}G or :{N}", desc = "Go to line N" },
  { category = "Navigation", keys = "<C-d> / <C-u>", desc = "Scroll half-page down / up" },
  { category = "Navigation", keys = "<C-f> / <C-b>", desc = "Scroll full page down / up" },

  -- Search & replace
  { category = "Search", keys = "/pattern<CR> / ?pattern<CR>", desc = "Search forward / backward" },
  { category = "Search", keys = "n / N", desc = "Repeat search, same / opposite direction" },
  { category = "Search", keys = "* / #", desc = "Search word under cursor, forward / backward" },
  { category = "Search", keys = ":%s/old/new/g", desc = "Replace all occurrences of old with new in the file" },
  { category = "Search", keys = ":s/old/new/g", desc = "Replace all occurrences on the current line" },

  -- Windows
  { category = "Windows", keys = "<C-h>", desc = "Move to left split" },
  { category = "Windows", keys = "<C-j>", desc = "Move to bottom split" },
  { category = "Windows", keys = "<C-k>", desc = "Move to top split" },
  { category = "Windows", keys = "<C-l>", desc = "Move to right split" },

  -- Editing & motions
  { category = "Editing", keys = "<M-Up> / <M-Down>", desc = "Move line/selection up or down (normal + visual)" },
  { category = "Editing", keys = "ys{motion}{char}", desc = "Add surround (e.g. ysiw\" surrounds word in quotes)" },
  { category = "Editing", keys = "cs{old}{new}", desc = "Change surround (e.g. cs\"' changes \" to ')" },
  { category = "Editing", keys = "ds{char}", desc = "Delete surround" },
  { category = "Editing", keys = "S{char}", desc = "Surround a visual selection" },
  { category = "Editing", keys = "S i  (or ys{motion}i)", desc = "Dynamic surround: prompts you to type any left/right text, any length (e.g. \"\"\", --[[ ]], /* */)" },
  { category = "Editing", keys = "V%", desc = "Select from an opening keyword/bracket to its match (e.g. function...end)" },
  { category = "Editing", keys = "s{2 chars}", desc = "Flash: jump anywhere visible on screen instantly" },
  { category = "Editing", keys = "S (shift-s)", desc = "Flash: jump/select by treesitter node" },
  { category = "Editing", keys = "%", desc = "Jump between matching if/else/end/tags (vim-matchup), not just brackets" },
  { category = "Editing", keys = "m{a-z}", desc = "Set a mark (native vim), now visible in the sign column" },
  { category = "Editing", keys = "`{a-z}", desc = "Jump to a mark (native vim)" },
  { category = "Editing", keys = "<leader>u", desc = "Toggle undo tree (navigate branching undo history)" },
  { category = "Editing", keys = "gc / gcc", desc = "Comment operator/line-comment (native to nvim 0.10+, no plugin)" },
  { category = "Editing", keys = "dd / dw / x", desc = "Delete line / word / character" },
  { category = "Editing", keys = "D / C", desc = "Delete / change to end of line" },
  { category = "Editing", keys = "cw / cc", desc = "Change word / change whole line" },
  { category = "Editing", keys = "p / P", desc = "Paste after / before the cursor" },
  { category = "Editing", keys = "u / <C-r>", desc = "Undo / redo" },
  { category = "Editing", keys = ".", desc = "Repeat the last change" },

  -- Text objects (treesitter)
  { category = "Text objects", keys = "af / if", desc = "Around/inside function" },
  { category = "Text objects", keys = "ac / ic", desc = "Around/inside class" },
  { category = "Text objects", keys = "aa / ia", desc = "Around/inside argument/parameter" },
  { category = "Text objects", keys = "]f / [f", desc = "Jump to next/previous function" },
  { category = "Text objects", keys = "]c / [c", desc = "Jump to next/previous class" },
  { category = "Text objects", keys = "]d / [d", desc = "Jump to next/previous diagnostic" },

  -- Buffers / tabs
  { category = "Buffers", keys = "<leader>bn", desc = "Next buffer/tab" },
  { category = "Buffers", keys = "<leader>bp", desc = "Previous buffer/tab" },
  { category = "Buffers", keys = "<leader>bx", desc = "Close buffer/tab" },

  -- File explorer
  { category = "File explorer", keys = "<leader>ee", desc = "Toggle nvim-tree file explorer" },
  { category = "File explorer", keys = "<leader>ef", desc = "Toggle file explorer and reveal current file" },

  -- Telescope
  { category = "Telescope", keys = "<leader>ff", desc = "Find files" },
  { category = "Telescope", keys = "<leader>fg", desc = "Live grep across project (needs ripgrep installed)" },
  { category = "Telescope", keys = "<leader>fb", desc = "Find open buffers" },
  { category = "Telescope", keys = "<leader>th", desc = "Switch colorscheme, live preview (kanagawa/tokyonight/nightfox/vscode/dracula/sonokai/nordic)" },
  { category = "Telescope", keys = "<leader>?", desc = "This cheatsheet picker" },

  -- LSP
  { category = "LSP", keys = "gd", desc = "Go to definition" },
  { category = "LSP", keys = "gr", desc = "Go to references" },
  { category = "LSP", keys = "K", desc = "Hover docs" },
  { category = "LSP", keys = "<leader>rn", desc = "Rename symbol" },
  { category = "LSP", keys = "<leader>ca", desc = "Code action" },
  { category = "LSP", keys = "<leader>e", desc = "Show full diagnostic message under cursor" },
  { category = "LSP", keys = "<leader>lt", desc = "Toggle pyright basic/strict type-checking" },
  { category = "LSP", keys = ":Mason", desc = "Open language server install UI (installed: lua_ls, pyright, ts_ls)" },
  { category = "LSP", keys = "<C-space> / <CR> / <Tab>", desc = "Completion popup: trigger / accept / next item" },

  -- Formatting
  { category = "Formatting", keys = "<leader>w", desc = "Save file — also auto-formats on write via conform.nvim (project formatter if found, e.g. oxfmt, else LSP)" },
  { category = "Formatting", keys = "<leader>cf", desc = "Format buffer (normal) or selection (visual) without saving" },
  { category = "Formatting", keys = ":ConformInfo", desc = "Show which formatter conform.nvim resolved for the current buffer" },

  -- Debugger
  { category = "Debugger", keys = "<leader>db", desc = "Toggle breakpoint" },
  { category = "Debugger", keys = "<leader>dc", desc = "Continue / start debugging" },
  { category = "Debugger", keys = "<leader>di / do / dO", desc = "Step into / over / out" },
  { category = "Debugger", keys = "<leader>dt", desc = "Terminate debug session" },
  { category = "Debugger", keys = "<leader>dr", desc = "Open native debug REPL" },
  { category = "Debugger", keys = "<leader>ds", desc = "Float: scopes panel" },
  { category = "Debugger", keys = "<leader>dw", desc = "Float: watches panel" },
  { category = "Debugger", keys = "<leader>df", desc = "Float: call stack panel" },
  { category = "Debugger", keys = "<leader>dp", desc = "Float: breakpoints panel" },
  { category = "Debugger", keys = "<leader>du", desc = "Float: console/output panel" },

  -- Terminal manager
  { category = "Terminal", keys = "<C-\\>", desc = "Toggle last-used terminal (prompts a name the first time)" },
  { category = "Terminal", keys = "2<C-\\>, 3<C-\\>...", desc = "Jump straight to the Nth terminal you created" },
  { category = "Terminal", keys = "<leader>tn", desc = "Create a new named terminal" },
  { category = "Terminal", keys = "<leader>tt", desc = "List terminals (Telescope): <CR> jump, <C-r> rename, <C-d> delete" },
  { category = "Terminal", keys = "<leader>tv", desc = "Toggle current terminal between floating and right-split" },
  { category = "Terminal", keys = "<C-q>", desc = "Exit terminal mode back to normal mode (any terminal buffer)" },

  -- Claude Code
  { category = "Claude", keys = "<leader>ac", desc = "Toggle Claude" },
  { category = "Claude", keys = "<leader>af", desc = "Focus Claude window" },
  { category = "Claude", keys = "<leader>ar", desc = "Resume Claude session (--resume)" },
  { category = "Claude", keys = "<leader>aC", desc = "Continue last Claude session (--continue)" },
  { category = "Claude", keys = "<leader>ab", desc = "Add current buffer as context" },
  { category = "Claude", keys = "<leader>as", desc = "Send selection to Claude (visual) / add file (from nvim-tree)" },
  { category = "Claude", keys = "<leader>aa", desc = "Accept Claude's proposed diff" },
  { category = "Claude", keys = "<leader>ad", desc = "Deny Claude's proposed diff" },

  -- C / C++
  { category = "C/C++", keys = "clangd", desc = "LSP for C/C++ — needs compile_commands.json (CMAKE_EXPORT_COMPILE_COMMANDS ON, or a .clangd pointing at the build dir) or it only understands single files" },
  { category = "C/C++", keys = "clang-tidy", desc = "Runs inside clangd (--clang-tidy flag) — extra warnings show up as normal LSP diagnostics" },
  { category = "C/C++", keys = "<leader>cf / save", desc = "Formats with clang-format, style from the project's .clang-format" },
  { category = "C/C++", keys = "<leader>dc", desc = "Launches codelldb, prompts for the path to the built executable" },
}
