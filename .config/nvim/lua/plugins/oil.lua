return {
	"stevearc/oil.nvim",
	opts = {
		columns = {
			"icon",
			"permissions",
			"size",
			-- "mtime",
		},

		view_options = {
			show_hidden = true,
		},

		keymaps_help = {
			border = nil,
		},
	},
	keys = {
		{
			"<leader>e",
			"<CMD>Oil<CR>",
			desc = "Open parent directory",
		},
	},
	-- Optional dependencies
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
}
