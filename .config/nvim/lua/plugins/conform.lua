return {
	{
		"stevearc/conform.nvim",

		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				markdown = { "prettier" },
				sh = { "shfmt" },
			},

			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = false,
			},
		},
	},
}
