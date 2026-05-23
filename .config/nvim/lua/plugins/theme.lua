require("tokyonight").setup({
	style = "tokyonight-night",
	transparent = true,
})

vim.cmd.colorscheme("tokyonight-night")

vim.api.nvim_set_hl(0, "MyFloatBorder", {
	fg = "#7fc8ff",
})

vim.api.nvim_set_hl(0, "MyFloatTitle", {
	fg = "#7fc8ff",
	bold = true,
})
