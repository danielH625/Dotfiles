local dap = require("dap")
local dapui = require("dapui")
local dapuiwidgets = require("dap.ui.widgets")
local dap_python = require("dap-python")

-- ============================================================================
-- DAP UI
-- ============================================================================

dapui.setup({})

require("nvim-dap-virtual-text").setup({
	commented = true,
})

-- ============================================================================
-- PYTHON PATH HELPER
-- ============================================================================

local function get_python_path()
	local venv = os.getenv("VIRTUAL_ENV")

	if venv then
		return venv .. "/bin/python"
	end

	return "/usr/bin/python3"
end

-- ============================================================================
-- PYTHON DEBUGGER
-- ============================================================================

dap_python.setup("~/.virtualenvs/debugpy/bin/python")

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "file",
		program = "${file}",
		pythonPath = get_python_path,
		console = "integratedTerminal",
	},

	{
		type = "python",
		request = "launch",
		name = "file:args",
		program = "${file}",

		args = function()
			local input = vim.fn.input("Arguments: ")
			return vim.split(input, " ")
		end,

		pythonPath = get_python_path,
	},

	{
		type = "python",
		request = "attach",
		name = "attach",

		connect = function()
			local host = vim.fn.input("Host [127.0.0.1]: ")
			host = host ~= "" and host or "127.0.0.1"

			local port = tonumber(vim.fn.input("Port: "))

			return {
				host = host,
				port = port,
			}
		end,
	},

	{
		type = "python",
		request = "launch",
		name = "file:doctest",
		module = "doctest",

		args = {
			"${file}",
		},

		pythonPath = get_python_path,
	},
}

-- ============================================================================
-- BREAKPOINT SIGNS
-- ============================================================================

vim.fn.sign_define("DapBreakpoint", {
	text = "",
	texthl = "DiagnosticSignError",
	linehl = "",
	numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
	text = "",
	texthl = "DiagnosticSignError",
	linehl = "",
	numhl = "",
})

vim.fn.sign_define("DapStopped", {
	text = "",
	texthl = "DiagnosticSignWarn",
	linehl = "Visual",
	numhl = "DiagnosticSignWarn",
})

-- ============================================================================
-- AUTO OPEN/CLOSE DAP UI
-- ============================================================================

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- ============================================================================
-- KEYMAPS
-- ============================================================================
local function map(lhs, rhs, desc)
	vim.keymap.set("n", lhs, rhs, {
		noremap = true,
		silent = true,
		desc = desc,
	})
end

local function vmap(lhs, rhs, desc)
	vim.keymap.set({ "n", "v" }, lhs, rhs, {
		noremap = true,
		silent = true,
		desc = desc,
	})
end

-- ============================================================================
-- Debug Controls
-- ============================================================================

map("<leader>dc", dap.continue, "Continue / Start")
map("<leader>di", dap.step_into, "Step Into")
map("<leader>dn", dap.step_over, "Step Over")
map("<leader>do", dap.step_out, "Step Out")

map("<leader>dr", dap.restart, "Restart")
map("<leader>dq", dap.terminate, "Terminate")
map("<leader>dd", dap.disconnect, "Disconnect")

-- ============================================================================
-- Breakpoints
-- ============================================================================

map("<leader>db", dap.toggle_breakpoint, "Toggle Breakpoint")

map("<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, "Conditional Breakpoint")

-- (🔥 Bonus: logpoint — VERY useful)
map("<leader>dl", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log message: "))
end, "Logpoint")

-- ============================================================================
-- UI
-- ============================================================================

map("<leader>du", dapui.toggle, "Toggle UI")

map("<leader>ds", function()
	dapuiwidgets.centered_float(dapuiwidgets.scopes)
end, "Preview Scopes")

-- ============================================================================
-- Eval / Watches
-- ============================================================================

vmap("<leader>de", function()
	dapui.eval()
end, "Eval Expression")

vmap("<leader>dw", function()
	dapui.eval(nil, { enter = true })
end, "Add Watch")
