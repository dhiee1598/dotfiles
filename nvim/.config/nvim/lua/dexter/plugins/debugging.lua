return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local mason_dap = require("mason-nvim-dap")

		mason_dap.setup({
			handlers = {},
		})

		vim.fn.sign_define("DapBreakpoint", {
			text = "⬤",
			texthl = "ErrorMsg",
			linehl = "",
			numhl = "ErrorMsg",
		})

		vim.fn.sign_define("DapBreakpointCondition", {
			text = "⬤",
			texthl = "ErrorMsg",
			linehl = "",
			numhl = "SpellBad",
		})

		dapui.setup()

		dap.configurations.php = {
			{
				name = "PHP: Listen for Xdebug",
				port = 9003,
				request = "launch",
				type = "php",
				breakpoints = {
					exception = {
						Notice = false,
						Warning = false,
						Error = false,
						Exception = false,
						["*"] = false,
					},
				},
			},
		}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })
		vim.keymap.set("n", "<F5>", dap.continue, {})
		vim.keymap.set("n", "<F10>", dap.step_over, {})
		vim.keymap.set("n", "<F11>", dap.step_into, {})
		vim.keymap.set("n", "<F9>", dap.step_out, {})
	end,
}
