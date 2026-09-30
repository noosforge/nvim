# Nvim Bible

Everything this config does, in one place. Press `<leader>?` inside nvim for a
live, fuzzy-searchable version of this same list (source: `lua/cheatsheet_data.lua`).

Leader key is **Space**.

## Basics
| Keys | What it does |
|---|---|
| `yy` / `p` | Yank/paste syncs with the system clipboard |
| `<leader>nh` | Clear search highlights |
| `<leader>w` | Save file |
| `<leader>q` | Quit window |
| `:e {filename}` | Create/open a file (written to disk on `:w`) — treesitter is unrelated to file creation |
| `:vs {filename}` / `:sp {filename}` | Create/open a file in a new vertical/horizontal split |
| `:w` | Save file (native — `<leader>w` above also runs this) |
| `:q` | Quit window |
| `:wq` / `:x` | Save and quit (`:x` only writes if there are changes) |
| `:q!` | Quit without saving |
| `:e!` | Reload file from disk, discarding unsaved changes |

## Modes
| Keys | What it does |
|---|---|
| `i` / `a` | Insert before / after the cursor |
| `I` / `A` | Insert at start / end of the line |
| `o` / `O` | Open a new line below / above and insert |
| `<Esc>` / `<C-c>` | Back to normal mode |
| `v` / `V` / `<C-v>` | Visual (char) / visual line / visual block |
| `gv` | Reselect the last visual selection |

## Navigation
| Keys | What it does |
|---|---|
| `0` / `^` / `$` | Start of line / first non-blank char / end of line |
| `w` / `b` / `e` | Next word / back a word / end of word |
| `gg` / `G` | Top / bottom of file |
| `{N}G` or `:{N}` | Go to line N |
| `<C-d>` / `<C-u>` | Scroll half-page down / up |
| `<C-f>` / `<C-b>` | Scroll full page down / up |

## Search & replace
| Keys | What it does |
|---|---|
| `/pattern<CR>` / `?pattern<CR>` | Search forward / backward |
| `n` / `N` | Repeat search, same / opposite direction |
| `*` / `#` | Search word under cursor, forward / backward |
| `:%s/old/new/g` | Replace all occurrences of `old` with `new` in the file |
| `:s/old/new/g` | Replace all occurrences on the current line |

## Windows
| Keys | What it does |
|---|---|
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Move to left/bottom/top/right split |

## Editing & motions
| Keys | What it does |
|---|---|
| `<M-Up>` / `<M-Down>` | Move line/selection up or down |
| `ys{motion}{char}` | Add surround (e.g. `ysiw"` wraps a word in quotes) |
| `cs{old}{new}` | Change surround (e.g. `cs"'`) |
| `ds{char}` | Delete surround |
| `S{char}` | Surround a visual selection |
| `s{2 chars}` | Flash-jump anywhere visible on screen |
| `S` | Flash: jump/select by treesitter node |
| `%` | Jump between matching if/else/end/tags (not just brackets) |
| `m{a-z}` / `` `{a-z} `` | Set / jump to a mark (now visible in the sign column) |
| `<leader>u` | Toggle the undo tree |
| `gc` / `gcc` | Comment operator / line-comment (native, no plugin) |
| `dd` / `dw` / `x` | Delete line / word / character |
| `D` / `C` | Delete / change to end of line |
| `cw` / `cc` | Change word / change whole line |
| `p` / `P` | Paste after / before the cursor |
| `u` / `<C-r>` | Undo / redo |
| `.` | Repeat the last change |

## Text objects (treesitter)
| Keys | What it does |
|---|---|
| `af` / `if` | Around / inside function |
| `ac` / `ic` | Around / inside class |
| `aa` / `ia` | Around / inside argument |
| `]f` / `[f` | Next/previous function |
| `]c` / `[c` | Next/previous class |
| `]d` / `[d` | Next/previous diagnostic |

## Buffers / tabs
| Keys | What it does |
|---|---|
| `<leader>bn` / `<leader>bp` | Next/previous buffer |
| `<leader>bx` | Close buffer |

## File explorer
| Keys | What it does |
|---|---|
| `<leader>ee` | Toggle file explorer |
| `<leader>ef` | Toggle + reveal current file |

## Telescope
| Keys | What it does |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (needs `ripgrep`) |
| `<leader>fb` | Find open buffers |
| `<leader>th` | Switch colorscheme, live preview |
| `<leader>?` | This cheatsheet, searchable |

## LSP
| Keys | What it does |
|---|---|
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>e` | Show diagnostic under cursor |
| `<leader>lt` | Toggle pyright basic/strict |
| `:Mason` | Install language servers (have: `lua_ls`, `pyright`, `ts_ls`) |
| `<C-space>` / `<CR>` / `<Tab>` | Trigger / accept / next completion item |

## Formatting
| Keys | What it does |
|---|---|
| `<leader>w` | Save file — also auto-formats on write via conform.nvim (project formatter if found, e.g. `oxfmt`, else LSP) |
| `<leader>cf` | Format buffer (normal) or selection (visual) without saving |
| `:ConformInfo` | Show which formatter conform.nvim resolved for the current buffer |

## Debugger (all floating, nothing docked)
| Keys | What it does |
|---|---|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue / start |
| `<leader>di` / `do` / `dO` | Step into / over / out |
| `<leader>dt` | Terminate |
| `<leader>dr` | Native REPL |
| `<leader>ds` / `dw` / `df` / `dp` / `du` | Float: scopes / watches / stack / breakpoints / console |

## Terminal manager
| Keys | What it does |
|---|---|
| `<C-\>` | Toggle last-used terminal (names it, first time) |
| `2<C-\>`, `3<C-\>`... | Jump to the Nth terminal created |
| `<leader>tn` | New named terminal |
| `<leader>tt` | List terminals: `<CR>` jump, `<C-r>` rename, `<C-d>` delete |
| `<leader>tv` | Toggle floating/right-split |
| `<C-q>` | Exit terminal mode (any terminal) |

## Claude Code
| Keys | What it does |
|---|---|
| `<leader>ac` | Toggle Claude |
| `<leader>af` | Focus Claude window |
| `<leader>ar` / `<leader>aC` | Resume / continue session |
| `<leader>ab` | Add current buffer as context |
| `<leader>as` | Send selection (visual) / add file (from tree) |
| `<leader>aa` / `<leader>ad` | Accept / deny diff |

## Plugins installed
lazy.nvim, kanagawa.nvim (+ tokyonight, nightfox, vscode, dracula, sonokai, nordic),
telescope.nvim, nvim-treesitter (+textobjects), mason + mason-lspconfig + nvim-lspconfig,
nvim-cmp (+luasnip, friendly-snippets), nvim-autopairs, nvim-dap (+dap-ui, virtual-text,
mason-nvim-dap), toggleterm.nvim, claudecode.nvim, nvim-tree, lualine, bufferline,
which-key, nvim-surround, vim-repeat, flash.nvim, vim-matchup, undotree, marks.nvim, lazydev.nvim,
conform.nvim.

## C / C++ (clangd + codelldb)
| Keys | What it does |
|---|---|
| `clangd` | LSP for C/C++ — go-to-def, diagnostics, signature help. Needs a `compile_commands.json` (CMake: `set(CMAKE_EXPORT_COMPILE_COMMANDS ON)`, or a `.clangd` file pointing at the build dir) or it only understands single files |
| clang-tidy | Runs inside clangd (`--clang-tidy` flag) — extra style/bug-pattern warnings show up as normal LSP diagnostics, no separate command |
| `<leader>cf` / save | Formats with `clang-format` (see Formatting above) — style comes from the project's `.clang-format` |
| `<leader>dc` (Debugger section) | Launches codelldb, prompts for the path to the built executable (e.g. `build/tests/smoke_test`) |

## Known gaps (not done yet)
- Debug adapters: `codelldb` wired for C/C++ (see above). `debugpy`/Python and others still aren't configured — DAP UI works, but nothing launches a Python debug session yet.
- `gopls` / `rust_analyzer` not installed — Treesitter highlights those languages but there's no Intellisense yet. (`clangd` for C/C++ is installed.)
- `~/.tmux.conf` doesn't exist — tmux pane navigation (`vim-tmux-navigator`) has no tmux-side config.
- GitHub push still pending.
