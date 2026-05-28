-- ============================================================================
-- CORE EDITING
-- ============================================================================

-- better movement in wrapped text
vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })
-- Keep the cursor in the center of the screen
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })
-- Select all text in the file
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- ============================================================================
-- BUFFERS, TABS, AND WINDOWS
-- ============================================================================

-- Buffer managment/navigation
vim.keymap.set("n", "<leader>bn", ":enew<CR>", { desc = "Open a new buffer" })
vim.keymap.set("n", "<leader>bc", ":bw<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bh", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bl", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>ba", "<cmd>%bd|e#<cr>", { desc = "Close all but current buffer" })
vim.keymap.set("n", "<leader>bx", "<cmd>bp|bd#<cr>", { desc = "Close buffer keep window" })
-- Tab managment/navigations
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "Create New Tab" })
vim.keymap.set("n", "<leader>tl", "gt", { desc = "Go to Next Tab" })
vim.keymap.set("n", "<leader>th", "gT", { desc = "Go to Previous Tab" })
-- Split panes and resize
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })
-- move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- ============================================================================
-- FILES OPS/MISC
-- ============================================================================

-- copy full file path
vim.keymap.set("n", "<leader>pa", function() -- show file path
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

-- ============================================================================
-- BLINK
-- ============================================================================

-- ============================================================================
-- DEBUG
-- ============================================================================

-- ============================================================================
-- FZF
-- ============================================================================
-- vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files" })
-- vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep" })
-- vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
-- vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help Tags" })
-- vim.keymap.set("n", "<leader>fx", fzf.diagnostics_document, { desc = "File Diagnostics" })
-- vim.keymap.set("n", "<leader>fX", fzf.diagnostics_workspace, { desc = "Workspace Diagnostics" })

-- ============================================================================
-- DEBUG
-- ============================================================================
-- vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
-- vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
-- vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "Step Over" })
-- vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })
-- vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart" })
-- vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Quit" })
-- vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Breakpoint" })
-- vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "UI" })
-- vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue / Start" })
-- vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
-- vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "Step Over" })
-- vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })
--
-- vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart" })
-- vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Terminate" })
-- vim.keymap.set("n", "<leader>dd", dap.disconnect, { desc = "Disconnect" })
--
-- -- Breakpoints
-- vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {
-- 	desc = "Toggle Breakpoint",
-- })
--
-- vim.keymap.set("n", "<leader>dB", function()
-- 	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
-- end, {
-- 	desc = "Conditional Breakpoint",
-- })
--
-- vim.keymap.set("n", "<leader>dl", function()
-- 	dap.set_breakpoint(nil, nil, vim.fn.input("Log message: "))
-- end, {
-- 	desc = "Logpoint",
-- })
--
-- -- UI
-- vim.keymap.set("n", "<leader>du", dapui.toggle, {
-- 	desc = "Toggle Debug UI",
-- })
--
-- vim.keymap.set("n", "<leader>ds", function()
-- 	widgets.centered_float(widgets.scopes)
-- end, {
-- 	desc = "Preview Scopes",
-- })
--
-- -- Eval / Watches
-- vim.keymap.set({ "n", "v" }, "<leader>de", function()
-- 	dapui.eval()
-- end, { desc = "Eval Expression" })
--
-- vim.keymap.set({ "n", "v" }, "<leader>dw", function()
-- 	dapui.eval(nil, { enter = true })
-- end, { desc = "Add Watch" })

-- ============================================================================
-- GIT SIGNS
-- ============================================================================

-- ============================================================================
-- LSP
-- ============================================================================

-- ============================================================================
-- OIL
-- ============================================================================

-- ============================================================================
-- SNACKS
-- ============================================================================
-- vim.keymap.set("n", "<leader>st", Snacks.terminal, { desc = "Terminal" })
-- vim.keymap.set("n", "<leader>sp", function()
-- 	Snacks.terminal("python3")
-- end, { desc = "Python REPL" })
-- vim.keymap.set("n", "<leader>gl", Snacks.lazygit, { desc = "LazyGit" })
-- vim.keymap.set("n", "<leader>nh", Snacks.notifier.show_history, { desc = "Notifications History" })

-- ============================================================================
-- WHICH KEY
-- ============================================================================
-- require("which-key").add({
-- 	{ "<leader>d", group = "Debug" },
-- 	{ "<leader>f", group = "Find" },
-- 	{ "<leader>l", group = "LSP" },
-- 	{ "<leader>g", group = "Git" },
-- 	{ "<leader>n", group = "Notifications" },
-- 	{ "<leader>b", group = "Buffers" },
-- 	{ "<leader>t", group = "Tabs" },
-- })
