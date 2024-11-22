return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Universal on_attach function for keymaps
			local on_attach = function(client, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				-- LSP keymaps
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts) -- Go to definition
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts) -- Go to declaration
				vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts) -- Find references
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts) -- Go to implementation
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts) -- Hover information
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts) -- Signature help
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts) -- Rename symbol
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts) -- Code action
				vim.keymap.set("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, bufopts) -- Format buffer
				vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts) -- Show diagnostics
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts) -- Go to previous diagnostic
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts) -- Go to next diagnostic
				vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, bufopts) -- Populate loclist with diagnostics
			end

			-- Pyright setup
			lspconfig.pyright.setup({
				capabilities = capabilities,
				on_attach = on_attach, -- Attach keymaps
				handlers = {
					["textDocument/publishDiagnostics"] = function() end,
				},
				settings = {
					pyright = {
						-- Using Ruff's import organizer
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							-- Ignore all files for analysis to exclusively use Ruff for linting
							ignore = { "*" },
						},
					},
				},
			})

			-- Ruff setup
			lspconfig.ruff.setup({
				capabilities = capabilities,
				on_attach = on_attach, -- Attach keymaps
			})

			-- Lua Language Server setup
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach, -- Attach keymaps
			})
		end,
	},
}
