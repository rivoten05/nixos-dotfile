-- lua/nvchad/colorify/init.lua

local M = {}
local api = vim.api

-- Create the extmark namespace as soon as this module is loaded.
local state = require("nvchad.colorify.state")
state.ns = api.nvim_create_namespace("Colorify")

-- Expose the attach function from the attach.lua module.
M.attach = require("nvchad.colorify.attach")

-- The 'run' function sets up the autocommands for the plugin.
M.run = function()
	-- Create a new autocommand group for Colorify to manage its autocommands.
	vim.api.nvim_create_augroup("Colorify", { clear = true })

	-- Define a list of events that will trigger the colorify logic.
	api.nvim_create_autocmd({
		"TextChanged",
		"TextChangedI",
		"TextChangedP",
		"VimResized",
		"LspAttach",
		"WinScrolled",
		"BufEnter",
	}, {
		group = "Colorify", -- Assign to the Colorify autocommand group.
		callback = function(args)
			-- Check if 'bl' (buflisted) option is true for the buffer.
			if vim.bo[args.buf].bl then
				-- Call the M.attach function with the buffer number and the event name.
				M.attach(args.buf, args.event)
			end
		end,
	})
end

return M
