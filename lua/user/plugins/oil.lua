return {
	'stevearc/oil.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{
			'<C-e>',
			function()
				require('oil').open()
			end,
			desc = 'File Picker',
		}
	},
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},
	},
}
