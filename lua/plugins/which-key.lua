return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    spec = {
      { '<leader>c', group = 'Code' },
      { '<leader>f', group = 'Find' },
      { '<leader>x', group = 'Trouble' },
    },
  },
}
