return {
  'rmehri01/onenord.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('onenord').setup({
      disable = {
        background = true
      }
    })
  end,
}
