local keymap = vim.keymap

keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- save / quit
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit window" })

-- move line(s) up/down (VSCode-style Alt+Up/Down; not a Vim default, we're adding it)
keymap.set("n", "<M-Down>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<M-Up>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- escape terminal mode (e.g. Claude's input) back to normal mode
-- plain <Esc> is forwarded to the running program, so it can't be used for this
keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- LSP (buffer-local, only active where a language server is attached)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf }
    keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Go to references" }))
    keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover docs" }))
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
    keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
    keymap.set("n", "<leader>e", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Show diagnostic" }))
    keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
    keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
  end,
})
