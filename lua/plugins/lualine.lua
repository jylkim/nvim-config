local nvimbattery = {
  function()
    return require("battery").get_status_line()
  end,
  -- color = { fg = 'violet' },
}

local function time ()
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
          lualine_z = { nvimbattery, time },
        }
      })
    end
  },
  {
    'justinhj/battery.nvim',
    dependences = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('battery').setup({})
    end
    }
}
