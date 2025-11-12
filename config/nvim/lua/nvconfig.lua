-- lua/nvconfig.lua (or wherever your main config module is)

local M = {}

-- Other general Neovim configurations might go here
-- M.options = {
--   tabstop = 2,
--   shiftwidth = 2,
--   expandtab = true,
-- }

-- THIS IS THE IMPORTANT PART FOR YOUR PLUGIN:
-- Your 'colorify' configuration table, as you provided.
M.colorify = {
	enabled = true, -- Whether the colorify plugin is active.
	mode = "virtual", -- Defines how colors are displayed: "fg", "bg", or "virtual"
	virt_text = "󱓻 ", -- The character to use for virtual text mode (requires Nerd Font)
	highlight = {
		hex = true, -- Enable highlighting of hex color codes
		lspvars = true, -- Enable highlighting of colors provided by LSP servers
	},
}

return M
