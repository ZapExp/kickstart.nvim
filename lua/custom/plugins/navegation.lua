return {
	{
		'mrjones2014/smart-splits.nvim',
	},

	{
		'mbbill/undotree',
		lazy = true,
		keys = {
			{ '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'UndoTree' },
		},
	},

	{
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			-- require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			require('hop').setup { keys = 'asdfghjklñ' }
		end,
		keys = {
			{ 'ñ', '<cmd>HopWord<cr>', desc = 'Hop to a word' },
			{ 'Ñ', '<cmd>HopLine<cr>', desc = 'Hop to a line' },
		},
	},

	{
		'ThePrimeagen/harpoon',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
	},

	-- file tree
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		keys = {
			{ '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'Open Nvim Tree' },
		},
		opts = {},
	},

}
