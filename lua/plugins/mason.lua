local user_keymap = require('utils.key_mapper').user_keymap

return {
  {
    'williamboman/mason.nvim',
    config = function()
      -- mason setup
      require('mason').setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      -- mason-lspconfig setup
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "ty", "ruff", "rust_analyzer", "jdtls", "gopls", "ts_ls", "eslint" },
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'nvim-telescope/telescope.nvim'
    },
    opts = {
      inlay_hints = { enabled = true },
    },
    config = function()
      -- nvim-lspconfig setup
      -- https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#suggested-configuration

      -- lua_ls
      vim.lsp.config('lua_ls', {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml',
          'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
      })

      -- ruff
      vim.lsp.config('ruff', {
        cmd = { 'ruff', 'server' },
        filetypes = { 'python' },
        root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
        settings = {
          lineLength = 100,
          organizeImports = true,
          fixAll = true,
          codeAction = {
            fixViolation = {
              enable = true,
            }
          },
          lint = {
            enable = true,
          }
        }
      })

      -- jdtls
      vim.lsp.config('jdtls', {
        cmd = { 'jdtls' },
        filetypes = { 'java' },
        root_markers = { 'pom.xml', 'build.gradle', '.git' },
      })

      -- gopls
      vim.lsp.config('gopls', {
        cmd = { 'gopls' },
        filetypes = { 'go' },
        root_markers = { 'go.mod', '.git' },
        settings = {
          gopls = {
            semanticTokens = true,
          }
        }
      })

      -- rust_analyzer
      vim.lsp.config('rust_analyzer', {
        cmd = { 'rust-analyzer' },
        filetypes = { 'rust' },
        root_markers = { 'Cargo.toml', '.git' },
      })

      vim.lsp.config("ts_ls", {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        root_markers = { "package.json", "tsconfig.json", ".git" },
      })

      -- Enable LSP servers
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('ty')
      vim.lsp.enable('ruff')
      vim.lsp.enable('jdtls')
      vim.lsp.enable('gopls')
      vim.lsp.enable('rust_analyzer')
      vim.lsp.enable('ts_ls')
      vim.lsp.enable('eslint')

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'Enable inlay hints',
        callback = function(event)
          local id = vim.tbl_get(event, 'data', 'client_id')
          local client = id and vim.lsp.get_client_by_id(id)
          if client == nil or not client.supports_method('textDocument/inlayHint') then
            return
          end

          vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
        end,
      })
      vim.diagnostic.config({
        virtual_text = true,
      })

      user_keymap('<leader>r', vim.diagnostic.open_float)
      user_keymap('[d', vim.diagnostic.goto_prev)
      user_keymap(']d', vim.diagnostic.goto_next)
      user_keymap('<leader>q', vim.diagnostic.setloclist)

      user_keymap('gD', vim.lsp.buf.declaration)
      user_keymap('K', vim.lsp.buf.hover)
      user_keymap('<leader>k', vim.lsp.buf.signature_help)
      user_keymap('<leader>rn', vim.lsp.buf.rename)
      user_keymap('<leader>ca', vim.lsp.buf.code_action, { 'n', 'v' })
      user_keymap('<leader>f', function()
        vim.lsp.buf.format { async = true }
      end)

      local builtin = require('telescope.builtin')
      user_keymap('gd', builtin.lsp_definitions)
      user_keymap('gr', builtin.lsp_references)
      user_keymap('gi', builtin.lsp_implementations)
      user_keymap('<leader>D', builtin.lsp_type_definitions)
      user_keymap('<leader>i', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
      end)
    end
  }
}
