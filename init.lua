-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

if vim.g.vscode then
  -- VSCode extension

  require('lazy').setup({
    {
      'echasnovski/mini.nvim',
      event = { 'BufReadPost', 'BufNewFile' },
      config = function()
        -- require('mini.completion').setup()
        require('mini.surround').setup()
      end,
    },
  }, {})

  vim.o.clipboard = 'unnamedplus'

  local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank { timeout = 250 }
    end,
    group = highlight_group,
    pattern = '*',
  })
else
  vim.g.lazygit_floating_window_scaling_factor = 1   -- scaling factor for floating window

  -- tree options
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  -- Set <space> as the leader key
  -- See `:help mapleader`
  --  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  require('lazy').setup({
    { import = 'custom.plugins' },
  }, {})

  -- custom lua
  require 'custom.init'
end
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
