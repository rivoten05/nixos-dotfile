local map = vim.keymap.set

-- ## Terminal & External Tools
map("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
map("t", "<esc><esc>", "<cmd>ToggleTerm<cr>", { desc = "Exit ToggleTerm" })

-- ## Flutter Tools
-- Grouped under leader + F
map("n", "<leader>Ff", "<cmd>FlutterRun<CR>", { desc = "Flutter Run" })
map("n", "<leader>Fq", "<cmd>FlutterQuit<CR>", { desc = "Flutter Quit" })
map("n", "<leader>Fr", "<cmd>FlutterReload<CR>", { desc = "Flutter Hot Reload" })
map("n", "<leader>FR", "<cmd>FlutterRestart<CR>", { desc = "Flutter Hot Restart" })
map("n", "<leader>Fd", "<cmd>FlutterDevices<CR>", { desc = "Flutter Devices" })

-- ## Todo Comments
map("n", "<leader>I", ":TodoTelescope<CR>", { desc = "Todo Telescope" })

-- ## Move Lines
map("n", "<A-j>", ":move .+1<CR>==", { desc = "Move Line Down" })
map("n", "<A-k>", ":move .-2<CR>==", { desc = "Move Line Up" })
map("v", "<A-j>", ":move '>+1<CR>gv=gv", { desc = "Move Selection Down" })
map("v", "<A-k>", ":move '<-2<CR>gv=gv", { desc = "Move Selection Up" })
map("i", "<A-j>", "<Esc>:move .+1<CR>==gi", { desc = "Move Line Down" })
map("i", "<A-k>", "<Esc>:move .-2<CR>==gi", { desc = "Move Line Up" })
