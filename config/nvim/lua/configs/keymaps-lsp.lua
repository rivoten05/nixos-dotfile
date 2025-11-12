local map = vim.keymap.set

-- ## LSP Navigation & Symbols
-- Grouped under leader + l
map("n", "<leader>ld", function()
	local ok, _ = pcall(vim.lsp.buf.definition)
	if not ok then
		vim.notify("LSP definition not available", vim.log.levels.WARN)
	end
end, { desc = "Go to Definition" })

map("n", "<leader>lD", function()
	local ok, _ = pcall(vim.lsp.buf.declaration)
	if not ok then
		vim.notify("LSP declaration not available", vim.log.levels.WARN)
	end
end, { desc = "Go to Declaration" })

map("n", "<leader>lt", function()
	local ok, _ = pcall(vim.lsp.buf.type_definition)
	if not ok then
		vim.notify("LSP type definition not available", vim.log.levels.WARN)
	end
end, { desc = "Go to Type Definition" })

map("n", "<leader>lI", function()
	local ok, _ = pcall(vim.lsp.buf.implementation)
	if not ok then
		vim.notify("LSP implementation not available", vim.log.levels.WARN)
	end
end, { desc = "Go to Implementation" })

map("n", "<leader>lr", function()
	local ok, _ = pcall(vim.lsp.buf.references)
	if not ok then
		vim.notify("LSP references not available", vim.log.levels.WARN)
	end
end, { desc = "Find References" })

map("n", "<leader>la", function()
	local ok, _ = pcall(vim.lsp.buf.code_action)
	if not ok then
		vim.notify("LSP code actions not available", vim.log.levels.WARN)
	end
end, { desc = "Code Actions" })

map("v", "<leader>la", function()
	local ok, _ = pcall(vim.lsp.buf.code_action)
	if not ok then
		vim.notify("LSP code actions not available", vim.log.levels.WARN)
	end
end, { desc = "Code Actions (Visual)" })

map("n", "<leader>lq", function()
	local ok, _ = pcall(vim.lsp.buf.code_action)
	if not ok then
		vim.notify("LSP quick fix not available", vim.log.levels.WARN)
	end
end, { desc = "Quick Fix" })

map("n", "<leader>ln", function()
	local ok, _ = pcall(vim.lsp.buf.rename)
	if not ok then
		vim.notify("LSP rename not available", vim.log.levels.WARN)
	end
end, { desc = "Rename Symbol" })

map("n", "<leader>lf", function()
	local ok, _ = pcall(vim.lsp.buf.format, { async = true })
	if not ok then
		vim.notify("LSP formatting not available", vim.log.levels.WARN)
	end
end, { desc = "Format Document" })

map("v", "<leader>lf", function()
	local ok, _ = pcall(vim.lsp.buf.format, { async = true })
	if not ok then
		vim.notify("LSP formatting not available", vim.log.levels.WARN)
	end
end, { desc = "Format Selection" })

map("n", "<leader>lh", function()
	local ok, _ = pcall(function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end)
	if not ok then
		vim.notify("Inlay hints not supported by LSP", vim.log.levels.WARN)
	end
end, { desc = "Toggle Inlay Hints" })

-- Symbol navigation
map("n", "<leader>ls", function()
	local ok, _ = pcall(vim.cmd, "Telescope lsp_document_symbols")
	if not ok then
		vim.notify("Document symbols not available", vim.log.levels.WARN)
	end
end, { desc = "Document Symbols" })

map("n", "<leader>lS", function()
	local ok, _ = pcall(vim.cmd, "Telescope lsp_workspace_symbols")
	if not ok then
		vim.notify("Workspace symbols not available", vim.log.levels.WARN)
	end
end, { desc = "Workspace Symbols" })

map("n", "<leader>lc", function()
	local ok, _ = pcall(vim.lsp.codelens.run)
	if not ok then
		vim.notify("Code lens not available", vim.log.levels.WARN)
	end
end, { desc = "Run Code Lens" })

map("n", "<leader>lC", function()
	local ok, _ = pcall(vim.lsp.codelens.refresh)
	if not ok then
		vim.notify("Code lens refresh not available", vim.log.levels.WARN)
	end
end, { desc = "Refresh Code Lens" })

map("n", "<leader>lo", function()
	local ok, _ = pcall(vim.cmd, "Telescope lsp_outgoing_calls")
	if not ok then
		vim.notify("Outgoing calls not available", vim.log.levels.WARN)
	end
end, { desc = "Outgoing Calls" })

map("n", "<leader>lI", function()
	local ok, _ = pcall(vim.cmd, "Telescope lsp_incoming_calls")
	if not ok then
		vim.notify("Incoming calls not available", vim.log.levels.WARN)
	end
end, { desc = "Incoming Calls" })

-- Enhanced hover and help
map("n", "<leader>lk", function()
	local ok, _ = pcall(vim.lsp.buf.hover)
	if not ok then
		vim.notify("LSP hover not available", vim.log.levels.WARN)
	end
end, { desc = "Hover Documentation" })

map("n", "<leader>lK", function()
	local ok, _ = pcall(vim.lsp.buf.signature_help)
	if not ok then
		vim.notify("LSP signature help not available", vim.log.levels.WARN)
	end
end, { desc = "Signature Help" })

map("i", "<C-k>", function()
	local ok, _ = pcall(vim.lsp.buf.signature_help)
	if not ok then
		vim.notify("LSP signature help not available", vim.log.levels.WARN)
	end
end, { desc = "Signature Help" })

-- Diagnostics navigation
map("n", "<leader>dp", function()
	local ok, _ = pcall(vim.diagnostic.goto_prev)
	if not ok then
		vim.notify("No previous diagnostic", vim.log.levels.WARN)
	end
end, { desc = "Previous Diagnostic" })

map("n", "<leader>dn", function()
	local ok, _ = pcall(vim.diagnostic.goto_next)
	if not ok then
		vim.notify("No next diagnostic", vim.log.levels.WARN)
	end
end, { desc = "Next Diagnostic" })

map("n", "<leader>dl", function()
	local ok, _ = pcall(vim.cmd, "Telescope diagnostics")
	if not ok then
		vim.notify("Diagnostics list not available", vim.log.levels.WARN)
	end
end, { desc = "List All Diagnostics" })

map("n", "<leader>dL", function()
	local ok, _ = pcall(vim.cmd, "Telescope diagnostics bufnr=0")
	if not ok then
		vim.notify("Buffer diagnostics not available", vim.log.levels.WARN)
	end
end, { desc = "List Buffer Diagnostics" })

map("n", "<leader>dd", function()
	local ok, _ = pcall(vim.diagnostic.open_float)
	if not ok then
		vim.notify("No diagnostic at cursor", vim.log.levels.WARN)
	end
end, { desc = "Show Diagnostic" })

map("n", "<leader>dq", function()
	local ok, _ = pcall(vim.diagnostic.setloclist)
	if not ok then
		vim.notify("Failed to set diagnostics loclist", vim.log.levels.WARN)
	end
end, { desc = "Send Diagnostics to Loclist" })

-- Quick navigation shortcuts
map("n", "gd", function()
	local ok, _ = pcall(vim.lsp.buf.definition)
	if not ok then
		vim.notify("LSP definition not available", vim.log.levels.WARN)
	end
end, { desc = "Go to Definition" })

map("n", "gD", function()
	local ok, _ = pcall(vim.lsp.buf.declaration)
	if not ok then
		vim.notify("LSP declaration not available", vim.log.levels.WARN)
	end
end, { desc = "Go to Declaration" })

map("n", "gi", function()
	local ok, _ = pcall(vim.lsp.buf.implementation)
	if not ok then
		vim.notify("LSP implementation not available", vim.log.levels.WARN)
	end
end, { desc = "Go to Implementation" })

map("n", "gi", function()
	local ok, _ = pcall(vim.lsp.buf.references)
	if not ok then
		vim.notify("LSP references not available", vim.log.levels.WARN)
	end
end, { desc = "Find References" })

map("n", "K", function()
	local ok, _ = pcall(vim.lsp.buf.hover)
	if not ok then
		vim.notify("LSP hover not available", vim.log.levels.WARN)
	end
end, { desc = "Hover Documentation" })

map("n", "<C-k>", function()
	local ok, _ = pcall(vim.lsp.buf.signature_help)
	if not ok then
		vim.notify("LSP signature help not available", vim.log.levels.WARN)
	end
end, { desc = "Signature Help" })
