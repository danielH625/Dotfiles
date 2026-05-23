local Snacks = require("snacks")

Snacks.setup({
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
})

vim.notify = Snacks.notifier.notify

vim.keymap.set("n", "<leader>st", function()
	Snacks.terminal()
end, { desc = "Floating terminal" })

vim.keymap.set("n", "<leader>sp", function()
	Snacks.terminal("python3")
end, { desc = "Floating Python3 REPL" })

vim.keymap.set("n", "<leader>gl", function()
	Snacks.lazygit()
end, { desc = "Open lazygit" })

vim.keymap.set("n", "<leader>nh", function()
	Snacks.notifier.show_history()
end, { desc = "Notification History" })
-- vim.keymap.set("n", "<leader>nd", function()
-- 	Snacks.notifier.hide()
-- end, { desc = "Dismiss All Notifications" })
