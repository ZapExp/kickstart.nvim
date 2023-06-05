return {
	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		event = { 'BufReadPost', 'BufNewFile' },
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',
			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{
				'j-hui/fidget.nvim',
				opts = {
					window = {
						blend = 0,
					},
				},
			},
			{
				'SmiteshP/nvim-navic',
				init = function()
					vim.g.navic_silence = true
				end,
				opts = function()
					return {
						separator = ' ',
						highlight = true,
						depth_limit = 5,
						icons = {
							Array = ' ',
							Boolean = ' ',
							Class = ' ',
							Color = ' ',
							Constant = ' ',
							Constructor = ' ',
							Copilot = ' ',
							Enum = ' ',
							EnumMember = ' ',
							Event = ' ',
							Field = ' ',
							File = ' ',
							Folder = ' ',
							Function = ' ',
							Interface = ' ',
							Key = ' ',
							Keyword = ' ',
							Method = ' ',
							Module = ' ',
							Namespace = ' ',
							Null = ' ',
							Number = ' ',
							Object = ' ',
							Operator = ' ',
							Package = ' ',
							Property = ' ',
							Reference = ' ',
							Snippet = ' ',
							String = ' ',
							Struct = ' ',
							Text = ' ',
							TypeParameter = ' ',
							Unit = ' ',
							Value = ' ',
							Variable = ' ',
						},
					}
				end,
			},
			-- Additional lua configuration, makes nvim stuff amazing!
			'folke/neodev.nvim',
		},
		config = function()
			require 'custom.config.lspconfig'
		end,
	},

	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		event = { 'BufReadPost', 'BufNewFile' },
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'L3MON4D3/LuaSnip',
			{
				'saadparwaiz1/cmp_luasnip',
				dependencies = { 'rafamadriz/friendly-snippets' },
				config = function()
					require 'custom.config.cmp'
				end,
			},
		},
	},

	{
		'echasnovski/mini.nvim',
		version = false,
		event = { 'BufReadPost', 'BufNewFile' },
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
					null_ls.builtins.formatting.prettierd.with {
						extra_args = {
							'--single-attribute-per-line',
						},
					},
					null_ls.builtins.formatting.rustywind,
				},
			}
		end,
	},

	{
		'nvim-pack/nvim-spectre',
		cmd = 'Spectre',
		opts = { open_cmd = 'noswapfile vnew' },
		-- stylua: ignore
		keys = {
			{ "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
		},
	},

	{
		'windwp/nvim-ts-autotag',
		lazy = true,
		event = { 'BufReadPost', 'BufNewFile' },
		opts = {},
	},

	{
		-- Add indentation guides even on blank lines
		'lukas-reineke/indent-blankline.nvim',
		event = { 'BufReadPost', 'BufNewFile' },
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help indent_blankline.txt`
		config = function()
			-- vim.opt.list = true
			-- vim.opt.listchars:append 'eol:↴'

			require('indent_blankline').setup {
				char = '▏',
				context_char = '▏',
				show_current_context = true,
				show_current_context_start = true,
				-- show_trailing_blankline_indent = false,
			}
		end,
	},
}
