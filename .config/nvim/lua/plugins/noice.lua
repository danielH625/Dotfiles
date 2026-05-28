return {
	"folke/noice.nvim",
	event = "VeryLazy",

	dependencies = {
		"MunifTanjim/nui.nvim",
	},

	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline_popup",

			format = {
				cmdline = { pattern = "^:", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", lang = "regex" },
			},
		},

		popupmenu = {
			enabled = true,
			backend = "nui",
		},

		messages = {
			enabled = true, -- IMPORTANT: let Snacks handle notifications
		},

		notify = {
			enabled = false, -- IMPORTANT: avoid conflict with Snacks
		},

		lsp = {
			progress = {
				enabled = false,
			},

			hover = {
				enabled = false,
			},

			signature = {
				enabled = false,
			},

			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = false,
				["vim.lsp.util.stylize_markdown"] = false,
				["cmp.entry.get_documentation"] = false,
			},
		},

		presets = {
			bottom_search = false,
			command_palette = true,
			long_message_to_split = false,
			inc_rename = false,
			lsp_doc_border = false,
		},

		views = {
			cmdline_popup = {
				position = { row = "45%", col = "50%" },
				size = { width = 60, height = "auto" },

				border = {
					style = "rounded",
					padding = { 0, 1 },
				},

				win_options = {
					winblend = 10,
					winhighlight = "FloatBorder:MyFloatBorder,FloatTitle:MyFloatTitle",
				},
			},

			popupmenu = {
				relative = "editor",
				position = { row = "50%", col = "50%" },
				size = { width = 60, height = 10 },

				border = {
					style = "rounded",
					padding = { 0, 1 },
				},

				win_options = {
					winblend = 10,
					winhighlight = "FloatBorder:MyFloatBorder",
				},
			},
		},
	},
}
