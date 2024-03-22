local user_keymap = require("utils.key_mapper").user_keymap

return {
  {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      user_keymap('<leader>ff', builtin.find_files)
      user_keymap('<leader>fg', builtin.live_grep)
      user_keymap('<leader>fb', builtin.buffers)
      user_keymap('<leader>fh', builtin.help_tags) 
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function() 
      require('telescope').setup({
        extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {
              }
            }
          }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
