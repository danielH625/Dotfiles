return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▏" },
			change = { text = "▏" },
			delete = { text = "◦" },
			topdelete = { text = "◦" },
			changedelete = { text = "●" },
			untracked = { text = "○" },
		},

		signcolumn = true,
		current_line_blame = false,

		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, {
					buffer = bufnr,
					desc = desc,
				})
			end

			-- Navigation
			map("n", "gn", function()
				gitsigns.nav_hunk("next")
			end, "Next git hunk")

			map("n", "gp", function()
				gitsigns.nav_hunk("prev")
			end, "Previous git hunk")

			-- Actions
			map("n", "<leader>gs", gitsigns.stage_hunk, "Stage hunk")
			map("n", "<leader>gr", gitsigns.reset_hunk, "Reset hunk")
			map("n", "<leader>gh", gitsigns.preview_hunk, "Preview hunk")

			map("n", "<leader>gb", function()
				gitsigns.blame_line({ full = true })
			end, "Blame line")

			map("n", "<leader>gt", gitsigns.toggle_current_line_blame, "Toggle blame")

			map("n", "<leader>gd", gitsigns.diffthis, "Diff this")

			-- Optional visual mode support (from docs)
			map("v", "<leader>hs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage hunk (range)")

			map("v", "<leader>hr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset hunk (range)")

			-- Text object
			map({ "o", "x" }, "ih", gitsigns.select_hunk, "Select hunk")
		end,
	},
}
