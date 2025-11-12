local map = vim.keymap.set
local builtin = require("telescope.builtin")

-- ## Git Operations
-- Enhanced navigation
map("n", "<leader>gf", function()
	local ok, _ = pcall(builtin.git_files)
	if not ok then
		vim.notify("Git files search not available (not in git repo)", vim.log.levels.WARN)
	end
end, { desc = "Search Git Files" })

map("n", "<leader>gb", function()
	local ok, _ = pcall(builtin.git_branches)
	if not ok then
		vim.notify("Git branches search not available", vim.log.levels.WARN)
	end
end, { desc = "Search Git Branches" })

map("n", "<leader>gc", function()
	local ok, _ = pcall(builtin.git_commits)
	if not ok then
		vim.notify("Git commits search not available", vim.log.levels.WARN)
	end
end, { desc = "Search Git Commits" })

map("n", "<leader>gC", function()
	local ok, _ = pcall(builtin.git_bcommits)
	if not ok then
		vim.notify("Git buffer commits search not available", vim.log.levels.WARN)
	end
end, { desc = "Search Git Commits for Buffer" })
