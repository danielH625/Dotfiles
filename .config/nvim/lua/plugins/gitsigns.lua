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
	require("gitsigns").next_hunk()
end, { desc = "Next git hunk" })
vim.keymap.set("n", "gp", function()
	require("gitsigns").prev_hunk()
end, { desc = "Previous git hunk" })
vim.keymap.set("n", "<leader>gs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gr", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>gh", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })
vim.keymap.set("n", "<leader>gt", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle inline blame" })
vim.keymap.set("n", "<leader>gd", function()
	require("gitsigns").diffthis()
end, { desc = "Diff this" })
