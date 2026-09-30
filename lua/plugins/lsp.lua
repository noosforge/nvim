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
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,
          -- pyright's type-checking strictness ("basic" vs "strict") is a server
          -- setting, not a project file, so we can flip it live (see <leader>lt below)
          pyright = function()
            require("lspconfig").pyright.setup({
              capabilities = capabilities,
              settings = {
                python = { analysis = { typeCheckingMode = "basic" } },
              },
            })
          end,
          -- clang-tidy on top of clangd's normal diagnostics; header-insertion off
          -- since auto-added #includes are more distracting than helpful while typing
          clangd = function()
            require("lspconfig").clangd.setup({
              capabilities = capabilities,
              cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=never" },
            })
          end,
        },
      })

      -- toggle pyright between "basic" and "strict" type-checking on the fly
      vim.keymap.set("n", "<leader>lt", function()
        local clients = vim.lsp.get_clients({ name = "pyright" })
        if #clients == 0 then
          vim.notify("pyright isn't attached to this buffer", vim.log.levels.WARN)
          return
        end
        for _, client in ipairs(clients) do
          local settings = client.config.settings
          local current = settings.python.analysis.typeCheckingMode
          local new_mode = current == "strict" and "basic" or "strict"
          settings.python.analysis.typeCheckingMode = new_mode
          client.notify("workspace/didChangeConfiguration", { settings = settings })
          vim.notify("pyright typeCheckingMode -> " .. new_mode)
        end
      end, { desc = "Toggle pyright basic/strict" })
    end,
  },
  "neovim/nvim-lspconfig",

  -- autocomplete popup wired to whatever LSP servers are attached
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets", -- ready-made snippet packs per language (loaded below)
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()

      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }),
      })
    end,
  },
}
