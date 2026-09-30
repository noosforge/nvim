return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    local conform = require("conform")
    local util = require("conform.util")

    conform.setup({
      formatters = {
        -- this project ships its own formatter (oxfmt) in node_modules/.bin;
        -- falls back to a global "oxfmt" binary for other projects that have one
        oxfmt = {
          command = util.from_node_modules("oxfmt"),
          args = { "$FILENAME" },
          stdin = false,
        },
      },
      formatters_by_ft = {
        javascript = { "oxfmt" },
        javascriptreact = { "oxfmt" },
        typescript = { "oxfmt" },
        typescriptreact = { "oxfmt" },
        json = { "oxfmt" },
        css = { "oxfmt" },
        c = { "clang-format" },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      conform.format({ async = true, lsp_format = "fallback" })
    end, { desc = "Format buffer/selection" })
  end,
}
