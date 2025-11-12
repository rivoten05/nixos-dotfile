-- File: lua/plugins/conform.lua

return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>fc",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	config = function()
		require("core.conform").setup()
	end,
}
