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
					comment = '<leader>/',
				},
				hooks = {
					pre = function()
						require('ts_context_commentstring.internal').update_commentstring {}
					end,
				},
			}

			require('mini.pairs').setup()

			require('mini.cursorword').setup()

			require('mini.surround').setup()
		end,
		dependencies = {
			{ 'JoosepAlviste/nvim-ts-context-commentstring', lazy = true },
		},
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
	{
		'ray-x/lsp_signature.nvim',
	},
	{
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			-- require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			require('hop').setup { keys = 'asdfghjklñ' }
		end,
	},
	{
		'mbbill/undotree',
		lazy = true,
		keys = {
			{ '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'UndoTree' },
		},
	},
	{
		'windwp/nvim-ts-autotag',
		lazy = true,
		event = { 'BufReadPost', 'BufNewFile' },
		config = function()
			require('nvim-ts-autotag').setup()
		end,
	},
}
