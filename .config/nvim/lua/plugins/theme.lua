return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,

  opts = {
    style = "tokyonight-night",
    transparent = true,

    on_highlights = function(hl)
      hl.MyFloatBorder = {
        fg = "#7fc8ff",
      }

      hl.MyFloatTitle = {
        fg = "#7fc8ff",
        bold = true,
      }
    end,
  },
}
--vim.cmd.colorscheme("tokyonight-night")

--vim.api.nvim_set_hl(0, "MyFloatBorder", {
--	fg = "#7fc8ff",
--})

--vim.api.nvim_set_hl(0, "MyFloatTitle", {
--	fg = "#7fc8ff",
--	bold = true,
--})
