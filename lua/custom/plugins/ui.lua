return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1000,
		config = function()
			require('catppuccin').setup {
				flavour = 'macchiato', -- latte, frappe, macchiato, mocha
				transparent_background = true,
				integrations = {
					gitsigns = true,
					harpoon = true,
					hop = true,
					mini = true,
					fidget = true,
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
		event = 'VeryLazy',
		opts = function()
			local icons = {
				dap = {
					Stopped = { '󰁕 ', 'DiagnosticWarn', 'DapStoppedLine' },
					Breakpoint = ' ',
					BreakpointCondition = ' ',
					BreakpointRejected = { ' ', 'DiagnosticError' },
					LogPoint = '.>',
				},
				diagnostics = {
					Error = ' ',
					Warn = ' ',
					Hint = ' ',
					Info = ' ',
				},
				git = {
					added = ' ',
					modified = ' ',
					removed = ' ',
				},
				kinds = {
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

			local fgf = function(name)
				---@type {foreground?:number}?
				local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name }) or
				vim.api.nvim_get_hl_by_name(name, true)
				local fg = hl and hl.fg or hl.foreground
				return fg and { fg = string.format('#%06x', fg) }
			end

			return {
				options = {
					theme = 'auto',
					globalstatus = true,
					disabled_filetypes = { statusline = { 'dashboard', 'alpha' } },
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch' },
					lualine_c = {
						{
							'filetype',
							icon_only = true,
							separator = '',
							padding = {
								left = 1,
								right = 0,
							},
						},
						{ 'filename', path = 1, symbols = { modified = '  ', readonly = '', unnamed = '' } },
						{
							'diagnostics',
							symbols = {
								error = icons.diagnostics.Error,
								warn = icons.diagnostics.Warn,
								info = icons.diagnostics.Info,
								hint = icons.diagnostics.Hint,
							},
						},
					},
					lualine_x = {
						{
							require('lazy.status').updates,
							cond = require('lazy.status').has_updates,
							color = fgf 'Special',
						},
						{
							'diff',
							symbols = {
								added = icons.git.added,
								modified = icons.git.modified,
								removed = icons.git.removed,
							},
						},
					},
					lualine_y = {
						{
							'progress',
							separator = ' ',
							padding = { left = 1, right = 0 },
						},
						{
							'location',
							padding = { left = 0, right = 1 },
						},
					},
					lualine_z = {
						function()
							return ' ' .. os.date '%R'
						end,
					},
				},
				extensions = { 'neo-tree', 'lazy' },
			}
		end,
		-- See `:help lualine.txt`
		-- opts = {
		-- 	options = {
		-- 		icons_enabled = false,
		-- 		theme = 'catppuccin',
		-- 		component_separators = '|',
		-- 		section_separators = '',
		-- 	},
		-- },
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
