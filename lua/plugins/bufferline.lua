return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    require('bufferline').setup {
      options = {
        mode = 'tabs',
        separator_style = 'slope',
        diagnostics = "nvim_lsp",
      }
    }
  end
}
