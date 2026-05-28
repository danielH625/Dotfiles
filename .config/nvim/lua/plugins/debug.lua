return {
	{
		"mfussenegger/nvim-dap",

		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"mfussenegger/nvim-dap-python",
			"nvim-neotest/nvim-nio",
		},

		keys = {
			{ "<leader>dc", desc = "Debug Continue" },
			{ "<leader>di", desc = "Step Into" },
			{ "<leader>dn", desc = "Step Over" },
			{ "<leader>do", desc = "Step Out" },
			{ "<leader>db", desc = "Toggle Breakpoint" },
			{ "<leader>du", desc = "Toggle DAP UI" },
		},

		cmd = {
			"DapContinue",
			"DapToggleBreakpoint",
			"DapStepInto",
			"DapStepOver",
			"DapStepOut",
			"DapTerminate",
			"DapRestart",
		},

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local widgets = require("dap.ui.widgets")
			local dap_python = require("dap-python")

			-- ============================================================
			-- UI
			-- ============================================================

			dapui.setup()

			require("nvim-dap-virtual-text").setup({
				commented = true,
			})

			-- ============================================================
			-- Python
			-- ============================================================

			dap_python.setup("python3")

			-- ============================================================
			-- Signs
			-- ============================================================

			vim.fn.sign_define("DapBreakpoint", {
				text = "",
				texthl = "DiagnosticSignError",
			})

			vim.fn.sign_define("DapBreakpointRejected", {
				text = "",
				texthl = "DiagnosticSignError",
			})

			vim.fn.sign_define("DapStopped", {
				text = "",
				texthl = "DiagnosticSignWarn",
				linehl = "Visual",
				numhl = "DiagnosticSignWarn",
			})

			-- ============================================================
			-- Auto open UI
			-- ============================================================

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			-- Uncomment if you want auto-close:
			--
			-- dap.listeners.before.event_terminated["dapui_config"] = function()
			--   dapui.close()
			-- end
			--
			-- dap.listeners.before.event_exited["dapui_config"] = function()
			--   dapui.close()
			-- end

			-- ============================================================
			-- Keymaps
			-- ============================================================

			local map = vim.keymap.set

			-- Debug controls
			map("n", "<leader>dc", dap.continue, { desc = "Continue / Start" })
			map("n", "<leader>di", dap.step_into, { desc = "Step Into" })
			map("n", "<leader>dn", dap.step_over, { desc = "Step Over" })
			map("n", "<leader>do", dap.step_out, { desc = "Step Out" })

			map("n", "<leader>dr", dap.restart, { desc = "Restart" })
			map("n", "<leader>dq", dap.terminate, { desc = "Terminate" })
			map("n", "<leader>dd", dap.disconnect, { desc = "Disconnect" })

			-- Breakpoints
			map("n", "<leader>db", dap.toggle_breakpoint, {
				desc = "Toggle Breakpoint",
			})

			map("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, {
				desc = "Conditional Breakpoint",
			})

			map("n", "<leader>dl", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log message: "))
			end, {
				desc = "Logpoint",
			})

			-- UI
			map("n", "<leader>du", dapui.toggle, {
				desc = "Toggle Debug UI",
			})

			map("n", "<leader>ds", function()
				widgets.centered_float(widgets.scopes)
			end, {
				desc = "Preview Scopes",
			})

			-- Eval / Watches
			map({ "n", "v" }, "<leader>de", function()
				dapui.eval()
			end, {
				desc = "Eval Expression",
			})

			map({ "n", "v" }, "<leader>dw", function()
				dapui.eval(nil, { enter = true })
			end, {
				desc = "Add Watch",
			})
		end,
	},
}
