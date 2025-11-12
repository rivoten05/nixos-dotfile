-- File: lua/core/lsp/init.lua

local M = {}

function M.setup()
	local servers = require("core.lsp.servers")

	-- Setup each server listed in servers.lua
	for _, lsp in ipairs(servers) do
		vim.lsp.enable(lsp)
	end
end

return M
