local map = vim.keymap.set
local builtin = require("telescope.builtin")

-- ## Telescope - Search & Find Operations
-- Grouped under leader + f (for 'find')
map("n", "<leader>ff", function()
	local ok, _ = pcall(builtin.find_files)
	if not ok then
		vim.notify("Find files not available", vim.log.levels.WARN)
	end
end, { desc = "Find Files" })

map("n", "<leader>fF", function()
	local ok, telescope = pcall(require, "telescope")
	if ok and telescope.extensions and telescope.extensions.smart_open then
		telescope.extensions.smart_open.smart_open()
	else
		vim.notify("Smart open not available", vim.log.levels.WARN)
	end
end, { desc = "Smart Open Files" })

map("n", "<leader>fg", function()
	local ok, _ = pcall(builtin.live_grep)
	if not ok then
		vim.notify("Live grep not available", vim.log.levels.WARN)
	end
end, { desc = "Live Grep" })

map("n", "<leader>fG", function()
	local ok, _ = pcall(builtin.live_grep, { cwd = vim.fn.expand("%:p:h") })
	if not ok then
		vim.notify("Live grep in directory not available", vim.log.levels.WARN)
	end
end, { desc = "Live Grep in Directory" })

map("n", "<leader>fb", function()
	local ok, _ = pcall(builtin.buffers)
	if not ok then
		vim.notify("Buffers search not available", vim.log.levels.WARN)
	end
end, { desc = "Find Buffers" })

map("n", "<leader>fo", function()
	local ok, _ = pcall(builtin.oldfiles)
	if not ok then
		vim.notify("Old files search not available", vim.log.levels.WARN)
	end
end, { desc = "Find Old Files" })

map("n", "<leader>fr", function()
	local ok, _ = pcall(builtin.resume)
	if not ok then
		vim.notify("Resume search not available", vim.log.levels.WARN)
	end
end, { desc = "Resume Last Search" })

map("n", "<leader>fz", function()
	local ok, _ = pcall(builtin.current_buffer_fuzzy_find)
	if not ok then
		vim.notify("Buffer fuzzy find not available", vim.log.levels.WARN)
	end
end, { desc = "Fuzzy Find in Current Buffer" })

map("n", "<leader>fh", function()
	local ok, _ = pcall(builtin.help_tags)
	if not ok then
		vim.notify("Help tags not available", vim.log.levels.WARN)
	end
end, { desc = "Find Help Tags" })

map("n", "<leader>fm", function()
	local ok, _ = pcall(builtin.man_pages)
	if not ok then
		vim.notify("Man pages not available", vim.log.levels.WARN)
	end
end, { desc = "Find Man Pages" })

map("n", "<leader>fk", function()
	local ok, _ = pcall(builtin.keymaps)
	if not ok then
		vim.notify("Keymaps search not available", vim.log.levels.WARN)
	end
end, { desc = "Find Keymaps" })

map("n", "<leader>fc", function()
	local ok, _ = pcall(builtin.commands)
	if not ok then
		vim.notify("Commands search not available", vim.log.levels.WARN)
	end
end, { desc = "Find Commands" })

map("n", "<leader>ft", function()
	local ok, _ = pcall(builtin.grep_string)
	if not ok then
		vim.notify("Grep string not available", vim.log.levels.WARN)
	end
end, { desc = "Find string under cursor" })

map("n", "<leader>fT", function()
	local ok, _ = pcall(builtin.grep_string, { search = vim.fn.expand("<cword>") })
	if not ok then
		vim.notify("Grep word under cursor not available", vim.log.levels.WARN)
	end
end, { desc = "Find Word Under Cursor" })

map("n", "<leader>fs", function()
	local ok, _ = pcall(builtin.symbols)
	if not ok then
		vim.notify("Symbols search not available", vim.log.levels.WARN)
	end
end, { desc = "Find Symbols" })

map("n", "<leader>fS", function()
	local ok, _ = pcall(builtin.lsp_workspace_symbols)
	if not ok then
		vim.notify("Workspace symbols not available", vim.log.levels.WARN)
	end
end, { desc = "Find Workspace Symbols" })

-- Quick search shortcuts
map("n", "<leader>/", function()
	local ok, _ = pcall(builtin.live_grep)
	if not ok then
		vim.notify("Project search not available", vim.log.levels.WARN)
	end
end, { desc = "Search in Project" })

map("n", "<leader>?", function()
	local ok, _ = pcall(builtin.current_buffer_fuzzy_find)
	if not ok then
		vim.notify("Buffer search not available", vim.log.levels.WARN)
	end
end, { desc = "Search in Current Buffer" })

map("n", "<leader>*", function()
	local ok, _ = pcall(builtin.grep_string, { search = vim.fn.expand("<cword>") })
	if not ok then
		vim.notify("Word search not available", vim.log.levels.WARN)
	end
end, { desc = "Search Word Under Cursor" })

map("v", "<leader>*", function()
	local text = vim.get_visual_selection()
	local ok, _ = pcall(builtin.grep_string, { search = text })
	if not ok then
		vim.notify("Visual selection search not available", vim.log.levels.WARN)
	end
end, { desc = "Search Visual Selection" })

-- Enhanced search and navigation
map("n", "<leader>sw", function()
	local ok, _ = pcall(builtin.grep_string, { search = vim.fn.expand("<cword>") })
	if not ok then
		vim.notify("Word search not available", vim.log.levels.WARN)
	end
end, { desc = "Search Word Under Cursor" })

map("n", "<leader>sd", function()
	local ok, _ = pcall(builtin.live_grep, { cwd = vim.fn.expand("%:p:h") })
	if not ok then
		vim.notify("Directory search not available", vim.log.levels.WARN)
	end
end, { desc = "Search in Directory" })

map("n", "<leader>sp", function()
	local ok, _ = pcall(builtin.live_grep)
	if not ok then
		vim.notify("Project search not available", vim.log.levels.WARN)
	end
end, { desc = "Search in Project" })

-- Quick navigation
map("n", "<leader>bb", function()
	local ok, _ = pcall(builtin.buffers)
	if not ok then
		vim.notify("Buffer list not available", vim.log.levels.WARN)
	end
end, { desc = "List Buffers" })

map("n", "<leader>bt", function()
	local ok, _ = pcall(builtin.filetypes)
	if not ok then
		vim.notify("File types list not available", vim.log.levels.WARN)
	end
end, { desc = "List File Types" })

map("n", "<leader>bh", function()
	local ok, _ = pcall(builtin.oldfiles)
	if not ok then
		vim.notify("Recent files not available", vim.log.levels.WARN)
	end
end, { desc = "Recent Files" })
