return {
	"neovim/nvim-lspconfig",

	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"williamboman/mason.nvim",
		"saghen/blink.cmp",
	},

	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		require("config.lsp-keybinds")

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		vim.lsp.config("pyright", {})
		vim.lsp.config("ruff", {})
		vim.lsp.config("bashls", {})

		vim.lsp.enable({
			"lua_ls",
			"pyright",
			"ruff",
			"bashls",
		})
	end,
}
