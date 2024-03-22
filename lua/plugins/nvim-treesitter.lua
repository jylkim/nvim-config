return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function () 
    local configs = require('nvim-treesitter.configs')

    configs.setup({
     ensure_installed = { 'c', 'lua', 'javascript', 'html', 'markdown', 'java', 'rust', 'python', 'cpp', 'typescript', 'css', 'toml', 'yaml', 'sql', 'bash', 'dockerfile' },
     sync_install = false,
     highlight = { enable = true },
     indent = { enable = true },  
    })
  end
 }
