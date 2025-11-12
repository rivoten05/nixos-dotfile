return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			ui = {
				border = "rounded",
				notification_style = "native",
			},
			decorations = {
				statusline = {
					app_version = false,
					device = true,
				},
			},
			widget_guides = {
				enabled = true,
			},
			closing_tags = {
				highlight = "ErrorMsg",
				prefix = "//",
				enabled = true,
			},
			lsp = {
				color = {
					enabled = true,
					background = false,
					foreground = false,
					virtual_text = true,
					virtual_text_str = "■",
				},
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
					enableSnippets = true,
				},
			},
			-- debugger = {
			-- 	enabled = true,
			-- 	run_via_dap = false,
			-- },
			-- dev_log = {
			--   enabled = true,
			--   open_cmd = "tabedit", -- command to use to open the log buffer
			-- },
		})
	end,
}
