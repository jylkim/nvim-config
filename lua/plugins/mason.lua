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
        ensure_installed = { "lua_ls", "rust_analyzer" },
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'nvim-telescope/telescope.nvim'
    },
    config = function()
      -- nvim-lspconfig setup
      -- https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#suggested-configuration
      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup {}
      lspconfig.rust_analyzer.setup {}

      -- user_keymap('<leader>e', vim.diagnostic.open_float)
      user_keymap('[d', vim.diagnostic.goto_prev)
      user_keymap(']d', vim.diagnostic.goto_next)
      user_keymap('<leader>q', vim.diagnostic.setloclist)

      user_keymap('gD', vim.lsp.buf.declaration)
      user_keymap('K', vim.lsp.buf.hover)
      user_keymap('<C-k>', vim.lsp.buf.signature_help)
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
    end
  }
}
