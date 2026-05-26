local gitsigns = require("gitsigns")

gitsigns.setup({
	signs = {
		add = { text = "\u{2590}" }, -- ▏
		change = { text = "\u{2590}" }, -- ▐
		delete = { text = "\u{2590}" }, -- ◦
		topdelete = { text = "\u{25e6}" }, -- ◦
		changedelete = { text = "\u{25cf}" }, -- ●
		untracked = { text = "\u{25cb}" }, -- ○
	},
	signcolumn = true,
	current_line_blame = false,
})

vim.keymap.set("n", "gn", function()
	gitsigns.next_hunk()
end, { desc = "Next git hunk" })
vim.keymap.set("n", "gp", function()
	gitsigns.prev_hunk()
end, { desc = "Previous git hunk" })
vim.keymap.set("n", "<leader>gs", function()
	gitsigns.stage_hunk()
end, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gr", function()
	gitsigns.reset_hunk()
end, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>gh", function()
	gitsigns.preview_hunk()
end, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gb", function()
	gitsigns.blame_line({ full = true })
end, { desc = "Blame line" })
vim.keymap.set("n", "<leader>gt", function()
	gitsigns.toggle_current_line_blame()
end, { desc = "Toggle inline blame" })
vim.keymap.set("n", "<leader>gd", function()
	gitsigns.diffthis()
end, { desc = "Diff this" })
