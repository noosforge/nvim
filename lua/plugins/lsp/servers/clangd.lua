local M = {}

function M.setup(capabilities)
  require("lspconfig").clangd.setup({
    capabilities = capabilities,
    cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=never" },
  })
end

return M
