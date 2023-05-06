-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		'echasnovski/mini.nvim',
		version = false,
		config = function()
			require("mini.basics").setup({
				mappings = {
					windows = true,
				},
				silent = false,
			})

			require('mini.completion').setup()

			require('mini.comment').setup({
				mappings = {
					comment_line = '<leader>/',
				}
			})

			require('mini.pairs').setup()

			require('mini.cursorword').setup()

			require('mini.surround').setup()
		end,
	}
}
