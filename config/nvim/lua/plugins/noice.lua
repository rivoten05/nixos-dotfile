-- File: lua/plugins/noice.lua

return {
	"folke/noice.nvim",
	event = "VimEnter",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {},
	config = function()
		require("core.noice").setup()
	end,
}
