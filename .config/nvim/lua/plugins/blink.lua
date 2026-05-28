return {
	"saghen/blink.cmp",
	branch = "main",
	event = "InsertEnter",
	dependencies = {
		"saghen/blink.lib",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},

	opts = {
		keymap = {
			preset = "none",
			["<C-Space>"] = { "show", "hide" },
			["<CR>"] = { "accept", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			menu = { auto_show = true },
		},

		sources = {
			default = { "lsp", "path", "buffer", "snippets" },
		},

		snippets = {
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
		},

		fuzzy = {
			implementation = "prefer_rust",
		},
	},
}
