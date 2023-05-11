return {
	-- {
	-- 	-- Theme inspired by Atom
	-- 	'navarasu/onedark.nvim',
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme 'onedark'
	-- 	end,
	-- },
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		config = function()
			require('catppuccin').setup {
				flavour = 'macchiato', -- latte, frappe, macchiato, mocha
				integrations = {
					fidget = true,
					gitsigns = true,
					harpoon = true,
					hop = true,
					mini = true,
					cmp = true,
					nvimtree = true,
					treesitter = true,
					telescope = true,
					which_key = true,
				},
			}
			vim.cmd.colorscheme 'catppuccin'
		end,
	},

	{
		-- Set lualine as statusline
		'nvim-lualine/lualine.nvim',
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = false,
				theme = 'catppuccin',
				component_separators = '|',
				section_separators = '',
			},
		},
	},

	-- Useful plugin to show you pending keybinds.
	{ 'folke/which-key.nvim', opts = {} },

	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			-- signs = {
			-- 	add = { hl = 'DiffAdd', text = '│', numhl = 'GitSignsAddNr' },
			-- 	change = { hl = 'DiffChange', text = '│', numhl = 'GitSignsChangeNr' },
			-- 	delete = { hl = 'DiffDelete', text = '󰍵', numhl = 'GitSignsDeleteNr' },
			-- 	topdelete = { hl = 'DiffDelete', text = '‾', numhl = 'GitSignsDeleteNr' },
			-- 	changedelete = { hl = 'DiffChangeDelete', text = '~', numhl = 'GitSignsChangeNr' },
			-- 	untracked = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
			-- },
		},
	},
}
