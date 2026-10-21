return {
  -- Mason: `:Mason` opens a Lazy-style UI for browsing/installing language servers
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup({
        -- servers here are auto-installed by Mason and auto-configured on attach
        -- TODO: add more servers here as we pick up new languages (e.g. gopls, rust_analyzer)
        ensure_installed = { "lua_ls", "pyright", "ts_ls", "clangd" },

        handlers = {
          -- default handler: for servers without a custom setup file.
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,

          -- pyright's type-checking strictness ("basic" vs "strict") is a server
          -- setting, not a project file, so we can flip it live (see <leader>lt lsp/keymaps)
          pyright = function()
            require("plugins.lsp.servers.pyright").setup(capabilities)
          end,

          -- clang-tidy on top of clangd's normal diagnostics; header-insertion off
          -- since auto-added #includes are more distracting than helpful while typing
          clangd = function()
            require("plugins.lsp.servers.clangd").setup(capabilities)
          end,
        },
      })
    end
  },
  "neovim/nvim-lspconfig",
}
