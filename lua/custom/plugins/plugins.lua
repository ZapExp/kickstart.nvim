return {
	{
		'mrjones2014/smart-splits.nvim',
	},
	{
		'echasnovski/mini.nvim',
		version = false,
		config = function()
			-- require('mini.completion').setup()

			require('mini.comment').setup {
				mappings = {
					comment_line = '<leader>/',
				},
			}

			require('mini.pairs').setup()

			require('mini.cursorword').setup()

			require('mini.surround').setup()
		end,
	},
	{
		'jose-elias-alvarez/null-ls.nvim',
		config = function()
			local null_ls = require 'null-ls'

			null_ls.setup {
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettierd.with { extra_args = { '--single-attribute-per-line' } },
				},
			}
		end,
	},
}
