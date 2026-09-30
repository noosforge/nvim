return {
  "coder/claudecode.nvim",
  config = function()
    require("claudecode").setup()

    local keymap = vim.keymap
    keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude" })
    keymap.set("n", "<leader>af", "<cmd>ClaudeCodeFocus<CR>", { desc = "Focus Claude window" })
    keymap.set("n", "<leader>ar", "<cmd>ClaudeCode --resume<CR>", { desc = "Resume Claude session" })
    keymap.set("n", "<leader>aC", "<cmd>ClaudeCode --continue<CR>", { desc = "Continue last Claude session" })
    keymap.set("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<CR>", { desc = "Add current buffer as context" })
    keymap.set({ "n", "v" }, "<leader>as", "<cmd>ClaudeCodeSend<CR>", { desc = "Send selection to Claude (or add file, from a tree)" })
    keymap.set("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<CR>", { desc = "Accept Claude diff" })
    keymap.set("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<CR>", { desc = "Deny Claude diff" })
  end,
}
