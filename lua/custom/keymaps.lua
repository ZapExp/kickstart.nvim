-- editting quality of life keymaps
-- visual
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- insert
vim.keymap.set('i', '<C-b>', '<ESC>^i')
vim.keymap.set('i', '<C-e>', '<End>')
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-l>', '<Right>')
vim.keymap.set('i', '<C-s>', '<esc>:w<cr>a')
-- normal
vim.keymap.set('n', '<C-s>', ':w<cr>')
vim.keymap.set('n', '<C-u>', '<C-u>zz0')
vim.keymap.set('n', '<C-d>', '<C-d>zz0')
vim.keymap.set('n', '{', '{zz0')
vim.keymap.set('n', '}', '}zz0')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<Esc>', ':noh<CR>')

-- Smart Splits keymaps
vim.keymap.set('n', '<C-Left>', require('smart-splits').resize_left)
vim.keymap.set('n', '<C-Down>', require('smart-splits').resize_down)
vim.keymap.set('n', '<C-Up>', require('smart-splits').resize_up)
vim.keymap.set('n', '<C-Right>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
-- swapping buffers between windows
-- vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
-- vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
-- vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
-- vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)

-- harpoon
vim.keymap.set('n', '<leader>ha', function()
	require('harpoon.mark').add_file()
end, { desc = 'Add file to Harpoon' })
vim.keymap.set('n', '<leader>ht', function()
	require('harpoon.ui').toggle_quick_menu()
end, { desc = 'Toggle quick menu' })
vim.keymap.set('n', '<leader>hf', function()
	require('harpoon.ui').nav_file(1)
end, { desc = 'Go to file 1' })
vim.keymap.set('n', '<leader>hg', function()
	require('harpoon.ui').nav_file(2)
end, { desc = 'Go to file 2' })
vim.keymap.set('n', '<leader>hh', function()
	require('harpoon.ui').nav_file(3)
end, { desc = 'Go to file 3' })
vim.keymap.set('n', '<leader>hj', function()
	require('harpoon.ui').nav_file(4)
end, { desc = 'Go to file 4' })
vim.keymap.set('n', '<leader>hn', function()
	require('harpoon.ui').nav_next()
end, { desc = 'Go to next file' })
vim.keymap.set('n', '<leader>hp', function()
	require('harpoon.ui').nav_prev()
end, { desc = 'Go to previous file' })

--File explorer
vim.keymap.set('n', '<leader>e', '<cmd>Ex<CR>', { desc = 'Open file [E]xplorer in current buffer' })

--Buffers
vim.keymap.set('n', '<leader>|', '<cmd>vsplit<CR>', { desc = 'Split buffer vertically' })
vim.keymap.set('n', '<leader>\\', '<cmd>split<CR>', { desc = 'Split buffer horizontally' })
