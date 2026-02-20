local user_keymap = require('utils.key_mapper').user_keymap

-- Neotree toggle
user_keymap('<leader>e', ':Neotree toggle<CR>', 'n', { desc = 'Neotree toggle' })

-- Pane navigation
user_keymap('<C-h>', '<C-w>h', 'n', { desc = 'Move to left pane' })
user_keymap('<C-j>', '<C-w>j', 'n', { desc = 'Move to below pane' })
user_keymap('<C-k>', '<C-w>k', 'n', { desc = 'Move to above pane' })
user_keymap('<C-l>', '<C-w>l', 'n', { desc = 'Move to right pane' })

-- Clear search highlights
user_keymap('<leader>h', ':nohlsearch<CR>', 'n', { desc = 'Clear search highlights' })

-- Tab navigation
user_keymap('<Tab>', 'gt', 'n', { desc = 'Next tab' })
user_keymap('<S-Tab>', 'gT', 'n', { desc = 'Previous tab' })

-- Split view
user_keymap('<leader>S', ':split<CR>', 'n', { desc = 'Horizontal split' })
user_keymap('<leader>s', ':vsplit<CR>', 'n', { desc = 'Vertical split' })

-- Move visual block
user_keymap('J', ':m<space>+1<CR>gv=gv', 'v', { desc = 'Move block down' })
user_keymap('K', ':m<space>-2<CR>gv=gv', 'v', { desc = 'Move block up' })

-- Maintain visual mode after shifting
user_keymap('>', '>gv', 'v', { desc = 'Indent and reselect' })
user_keymap('<', '<gv', 'v', { desc = 'Unindent and reselect' })
