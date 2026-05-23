local wk = require("which-key")

wk.setup({
	delay = 2000,
})

wk.add({
	{ "<leader>d", group = "Debug" },
	{ "<leader>f", group = "Find" },
	{ "<leader>l", group = "LSP" },
	{ "<leader>g", group = "GIT" },
	{ "<leader>n", group = "Notifications" },
})
