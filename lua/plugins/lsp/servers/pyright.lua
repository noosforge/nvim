local M = {}

function M.setup(capabilities)
  require("lspconfig").pyright.setup({
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
        },
      },
    },
  })
end

return M
