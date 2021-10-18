local dap = require("dap")

require("dap-install").config("python", {})

dap.adapters.lldb = {type = "executable", command = "/usr/local/bin/lldb-vscode", name = "lldb"}
dap.configurations.c = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = false
	}
}
