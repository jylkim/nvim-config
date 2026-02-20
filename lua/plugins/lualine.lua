local function time()
  return os.date("%H:%M:%S", os.time())
end

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'onenord',
          extensions = { 'neo-tree' },
        },
        sections = {
          lualine_y = { 'progress', 'location' },
          lualine_z = { time },
        }
      })
    end
  }
}
