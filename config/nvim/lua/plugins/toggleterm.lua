return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				start_in_insert = true,
				insert_mappings = true,
				close_on_exit = true,
				direction = "float",
				persist_size = true,
				persist_mode = true,
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				float_opts = {
					border = "rounded",
				},
			})
		end,
	},
}
