local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },

		python = { "ruff_format" },

		javascript = { "prettier" },
		javascriptreact = { "prettier" },

		typescript = { "prettier" },
		typescriptreact = { "prettier" },

		json = { "fixjson" },
		jsonc = { "fixjson" },

		markdown = { "prettier" },

		sh = { "shfmt" },

		go = { "gofumpt" },

		c = { "clang_format" },
		cpp = { "clang_format" },
	},

	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = false,
	},
})
