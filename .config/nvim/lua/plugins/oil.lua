local oil = require("oil")

oil.setup({
	columns = {
		"icon",
		"permissions",
		"size",
		-- "mtime",
	},
	view_options = {
		show_hidden = true,
	},
	-- Configuration for the floating keymaps help window
	keymaps_help = {
		border = nil,
	},
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
