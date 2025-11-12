local map = vim.keymap.set
-- ## Alpha
map("n", "<leader>h", "<cmd>Alpha<CR>", { desc = "Alpha" })

---------------------------------------------------

-- ## ToggleContrast
map("n", "<leader>Hc", "<cmd>ToggleContrast<CR>", { desc = "Toggle High Contrast" })

-- ## Performance Monitoring
map("n", "<leader>ps", "<cmd>Lazy profile<CR>", { desc = "Profile plugin startup time" })
map("n", "<leader>pl", "<cmd>Lazy log<CR>", { desc = "Show Lazy logs" })
map("n", "<leader>ph", "<cmd>Lazy health<CR>", { desc = "Check plugin health" })
map("n", "<leader>pm", "<cmd>messages<CR>", { desc = "Show recent messages" })
map("n", "<leader>pt", function()
	local stats = require("lazy").stats()
	local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
	vim.notify(
		string.format("⚡ Neovim loaded %d/%d plugins in %s ms", stats.loaded, stats.count, ms),
		vim.log.levels.INFO
	)
end, { desc = "Show startup time" })

-- ## Quality of Life Improvements
-- Better search
map("n", "<leader>Hh", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Quick commands
map("n", "<leader>Hd", "<cmd>cd %:p:h<CR><cmd>pwd<CR>", { desc = "Change to current file directory" })
map(
	"n",
	"<leader>Hp",
	"<cmd>let @+ = expand('%:p')<CR><cmd>echo 'Copied: ' . @+<CR>",
	{ desc = "Copy current file path" }
)
map(
	"n",
	"<leader>HP",
	"<cmd>let @+ = expand('%:p:h')<CR><cmd>echo 'Copied: ' . @+<CR>",
	{ desc = "Copy current file directory" }
)

-- Quick access to important files
local builtin = require("telescope.builtin")
map("n", "<leader>fN", function()
	builtin.find_files({ cwd = "~/.config/nvim" })
end, { desc = "Edit Neovim Config" })
