return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"vim",
			"vimdoc",
			"rust",
			"c",
			"cpp",
			"go",
			"html",
			"css",
			"javascript",
			"json",
			"lua",
			"markdown",
			"python",
			"typescript",
			"vue",
			"svelte",
			"bash",
		},

		auto_install = true,

		highlight = {
			enable = true,
		},

		indent = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
		},
		textobjects = {
			enable = true,
		},
	},
}
