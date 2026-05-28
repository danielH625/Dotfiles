return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 2000,
	},
	config = function(_, opts)
		require("which-key").setup(opts)

		require("which-key").add({
			{ "<leader>d", group = "Debug" },
			{ "<leader>f", group = "Find" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>g", group = "Git" },
			{ "<leader>n", group = "Notifications" },
			{ "<leader>t", group = "Tabs" },
			{ "<leader>b", group = "Buffers" },
		})
	end,
}
