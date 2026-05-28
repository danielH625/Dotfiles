return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	opts = {
		terminal = { enabled = true },
		lazygit = { enabled = true },

		notifier = {
			enabled = true,
			timeout = 3000,
			style = "fancy",
			top_down = true,
			icons = {
				error = " ",
				warn = " ",
				info = " ",
				debug = " ",
				trace = " ",
			},
		},

		styles = {
			terminal = {
				position = "float",
				border = "rounded",
				backdrop = 60,
				height = 0.8,
				width = 0.8,
				zindex = 50,
				wo = {
					winblend = 10,
					winhighlight = "FloatBorder:MyFloatBorder,FloatTitle:MyFloatTitle",
				},
			},

			lazygit = {
				border = "rounded",
				backdrop = 60,
				height = 0.9,
				width = 0.9,
				zindex = 50,
				wo = {
					winhighlight = "FloatBorder:MyFloatBorder,FloatTitle:MyFloatTitle",
				},
			},

			notification = {
				border = "rounded",
				wo = {
					winblend = 10,
					winhighlight = "FloatBorder:MyFloatBorder,FloatTitle:MyFloatTitle",
				},
			},

			notification_history = {
				border = "rounded",
				wo = {
					winblend = 10,
					winhighlight = "FloatBorder:MyFloatBorder,FloatTitle:MyFloatTitle",
				},
			},
		},
	},

	config = function(_, opts)
		require("snacks").setup(opts)

		-- imperative stuff stays here
		vim.notify = require("snacks").notifier.notify
	end,

	keys = {
		{
			"<leader>st",
			function()
				require("snacks").terminal()
			end,
			desc = "Floating terminal",
		},

		{
			"<leader>sp",
			function()
				require("snacks").terminal("python3")
			end,
			desc = "Python REPL",
		},

		{
			"<leader>gl",
			function()
				require("snacks").lazygit()
			end,
			desc = "LazyGit",
		},

		{
			"<leader>nh",
			function()
				require("snacks").notifier.show_history()
			end,
			desc = "Notification History",
		},
	},
}
