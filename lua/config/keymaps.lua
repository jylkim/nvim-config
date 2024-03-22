local user_keymap = require('utils.key_mapper').user_keymap

-- Neotree toggle
user_keymap('<leader>e', ':Neotree toggle<CR>')

-- Pane navigation 
user_keymap('<C-h>', '<C-w>h') -- Left
user_keymap('<C-j>', '<C-w>j') -- Down
user_keymap('<C-k>', '<C-w>k') -- Up
user_keymap('<C-l>', '<C-w>l') -- Right

-- Clear search highlights 
user_keymap('<leader>h', ':nohlsearch<CR>')

-- Tab navigation
user_keymap('<Tab>', 'gt')
user_keymap('<S-Tab>', 'gT')

-- Split view
user_keymap('<leader>S', ':split<CR>')
user_keymap('<leader>s', ':vsplit<CR>')

-- Move visual block
user_keymap('J', ':m<space>+1<CR>gv=gv', 'v')
user_keymap('K', ':m<space>-2<CR>gv=gv', 'v')

-- Maintain visual mode after shifting
user_keymap('>', '>gv', 'v')
user_keymap('<', '<gv', 'v')
