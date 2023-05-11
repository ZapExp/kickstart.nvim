return {
	{
		'kdheepak/lazygit.nvim',
		keys = {
			{ '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Open LazyGit' },
		},
	},

	-- Detect tabstop and shiftwidth automatically
	-- 'tpope/vim-sleuth',

	-- Fuzzy Finder (files, lsp, etc)
	{
		'nvim-telescope/telescope.nvim',
		version = '*',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require 'custom.config.telescope'
		end,
		keys = {
			{
				'<leader>?',
				function()
					require('telescope.builtin').oldfiles()
				end,
				desc = '[?] Find recently opened files',
			},
			{
				'<leader><space>',
				function()
					require('telescope.builtin').buffers()
				end,
				desc = '[ ] Find existing buffers',
			},
			{
				'<leader>gf',
				function()
					require('telescope.builtin').git_files()
				end,
				desc = 'Search [G]it [F]iles',
			},
			{
				'<leader>sf',
				function()
					require('telescope.builtin').find_files()
				end,
				desc = '[S]earch [F]iles',
			},
			{
				'<leader>sh',
				function()
					require('telescope.builtin').help_tags()
				end,
				desc = '[S]earch [H]elp',
			},
			{
				'<leader>sw',
				function()
					require('telescope.builtin').grep_string()
				end,
				desc = '[S]earch current [W]ord',
			},
			{
				'<leader>sg',
				function()
					require('telescope.builtin').live_grep()
				end,
				desc = '[S]earch by [G]rep',
			},
			{
				'<leader>sd',
				function()
					require('telescope.builtin').diagnostics()
				end,
				desc = '[S]earch [D]iagnostics',
			},
		},
	},

	-- Fuzzy Finder Algorithm which requires local dependencies to be built.
	-- Only load if `make` is available. Make sure you have the system
	-- requirements installed.
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		-- NOTE: If you are having trouble with this installation,
		--       refer to the README for telescope-fzf-native for more instructions.
		build = 'make',
		cond = function()
			return vim.fn.executable 'make' == 1
		end,
	},

	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		event = { 'BufReadPost', 'BufNewFile' },
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
		config = function()
			require 'custom.config.treesitter'
		end,
	},
}
