-- ============================================================================
-- Mason
-- ============================================================================
require("mason").setup({})

-- ============================================================================
-- LSP
-- ============================================================================
local augroup = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

vim.diagnostic.config({
	virtual_text = { prefix = "●", spacing = 4 },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		focusable = false,
		style = "minimal",
	},
})

do
	local orig = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded"
		return orig(contents, syntax, opts, ...)
	end
end

local function lsp_on_attach(ev)
	local client = vim.lsp.get_client_by_id(ev.data.client_id)
	if not client then
		return
	end

	local bufnr = ev.buf
	local opts = { noremap = true, silent = true, buffer = bufnr }

	local function map(lhs, rhs, desc)
		vim.keymap.set("n", lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
	end

	-- ============================================================================
	-- LSP: Navigation
	-- ============================================================================

	map("<leader>ld", function()
		require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
	end, "Definition")

	map("<leader>lD", vim.lsp.buf.definition, "Definition (direct)")

	map("<leader>ls", function()
		vim.cmd("vsplit")
		vim.lsp.buf.definition()
	end, "Definition (split)")

	map("<leader>lr", function()
		require("fzf-lua").lsp_references()
	end, "References")

	map("<leader>li", function()
		require("fzf-lua").lsp_implementations()
	end, "Implementations")

	map("<leader>lt", function()
		require("fzf-lua").lsp_typedefs()
	end, "Type Definitions")

	-- ============================================================================
	-- LSP: Actions
	-- ============================================================================

	map("<leader>la", vim.lsp.buf.code_action, "Code Action")
	map("<leader>lR", vim.lsp.buf.rename, "Rename Symbol")

	-- ============================================================================
	-- LSP: Diagnostics
	-- ============================================================================

	map("<leader>le", function()
		vim.diagnostic.open_float({ scope = "line" })
	end, "Line Diagnostics")

	map("<leader>lE", function()
		vim.diagnostic.open_float({ scope = "cursor" })
	end, "Cursor Diagnostics")

	map("<leader>ln", function()
		vim.diagnostic.jump({ count = 1 })
	end, "Next Diagnostic")

	map("<leader>lp", function()
		vim.diagnostic.jump({ count = -1 })
	end, "Previous Diagnostic")

	vim.keymap.set("n", "<leader>lq", function()
		vim.diagnostic.setloclist({ open = true })
	end, { desc = "Diagnostics List" })

	vim.keymap.set("n", "<leader>lT", function()
		vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	end, { desc = "Toggle diagnostics" })

	-- ============================================================================
	-- LSP: Organize Imports (if supported)
	-- ============================================================================

	if client:supports_method("textDocument/codeAction", bufnr) then
		map("<leader>lo", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
				bufnr = bufnr,
			})
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50)
		end, "Organize Imports")
	end

	-- ============================================================================
	-- Global LSP (non-leader)
	-- ============================================================================

	map("K", vim.lsp.buf.hover, "Hover Documentation")
end

vim.api.nvim_create_autocmd("LspAttach", { group = augroup, callback = lsp_on_attach })

-- ============================================================================
-- Blink
-- ============================================================================

require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<C-Space>"] = { "show", "hide" },
		["<CR>"] = { "accept", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<Tab>"] = { "accept", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },
	},
	appearance = { nerd_font_variant = "mono" },
	completion = { menu = { auto_show = true } },
	sources = { default = { "lsp", "path", "buffer", "snippets" } },
	snippets = {
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
	},

	fuzzy = {
		implementation = "prefer_rust",
		prebuilt_binaries = { download = true },
	},
})

vim.lsp.config["*"] = {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
}

-- ============================================================================
-- Linters & Formatters & Languages
-- ============================================================================

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
		},
	},
})
vim.lsp.config("pyright", {})
vim.lsp.config("bashls", {})
vim.lsp.config("ts_ls", {})
vim.lsp.config("gopls", {})
vim.lsp.config("clangd", {})

do
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	local ruff = require("efmls-configs.linters.ruff")
	local ruff_format = require("efmls-configs.formatters.ruff")

	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local eslint_d = require("efmls-configs.linters.eslint_d")

	local fixjson = require("efmls-configs.formatters.fixjson")

	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")

	local cpplint = require("efmls-configs.linters.cpplint")
	local clangfmt = require("efmls-configs.formatters.clang_format")

	local go_revive = require("efmls-configs.linters.go_revive")
	local gofumpt = require("efmls-configs.formatters.gofumpt")

	vim.lsp.config("efm", {
		filetypes = {
			"c",
			"cpp",
			"css",
			"go",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"lua",
			"markdown",
			"python",
			"sh",
			"typescript",
			"typescriptreact",
			"vue",
			"svelte",
		},
		init_options = { documentFormatting = true },
		settings = {
			languages = {
				c = { clangfmt, cpplint },
				go = { gofumpt, go_revive },
				cpp = { clangfmt, cpplint },
				css = { prettier_d },
				html = { prettier_d },
				javascript = { eslint_d, prettier_d },
				javascriptreact = { eslint_d, prettier_d },
				json = { eslint_d, fixjson },
				jsonc = { eslint_d, fixjson },
				lua = { luacheck, stylua },
				markdown = { prettier_d },
				python = { ruff, ruff_format },
				sh = { shellcheck, shfmt },
				typescript = { eslint_d, prettier_d },
				typescriptreact = { eslint_d, prettier_d },
				vue = { eslint_d, prettier_d },
				svelte = { eslint_d, prettier_d },
			},
		},
	})
end

vim.lsp.enable({
	"lua_ls",
	"pyright",
	"bashls",
	"ts_ls",
	"gopls",
	"clangd",
	"efm",
})
