return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		require("oil").setup({ view_options = { show_hidden = true } })
	end,
	keys = {
		{ "<C-e>", ":Oil<CR>", desc = "Open Oil" },
	},
}
