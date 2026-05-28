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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

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

	map("<leader>lq", function()
		vim.diagnostic.setloclist({ open = true })
	end, "Diagnostics List")

	vim.keymap.set("n", "<leader>lT", function()
		vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	end, { desc = "Toggle diagnostics" })

	-- ============================================================================
	-- LSP: Organize Imports (if supported)
	-- ============================================================================

	-- if client:supports_method("textDocument/codeAction", bufnr) then
	-- 	map("<leader>lo", function()
	-- 		vim.lsp.buf.code_action({
	-- 			context = { only = { "source.organizeImports" }, diagnostics = {} },
	-- 			apply = true,
	-- 			bufnr = bufnr,
	-- 		})
	-- 		vim.defer_fn(function()
	-- 			require("conform").format({ bufnr = bufnr })
	-- 		end, 50)
	-- 	end, "Organize Imports")
	-- end

	-- ============================================================================
	-- Global LSP (non-leader)
	-- ============================================================================

	map("K", vim.lsp.buf.hover, "Hover Documentation")
end

vim.api.nvim_create_autocmd("LspAttach", { group = augroup, callback = lsp_on_attach })
