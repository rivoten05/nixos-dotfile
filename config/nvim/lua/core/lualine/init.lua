local sections = require("core.lualine.sections")

local M = {}

function M.setup()
	local lualine = require("lualine")

	lualine.setup({
		options = {
			theme = "catppuccin",
			icons_enabled = true,
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			globalstatus = true,
		},
		sections = sections.active,
		winbar = sections.winbar,
		inactive_winbar = sections.inactive_winbar,
	})
end

return M
