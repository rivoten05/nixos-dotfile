local map = vim.keymap.set

-- ## Core Navigation & Movement
-- Disable space in normal mode
map("n", "<Space>", "<Nop>", { desc = "Disable Space" })

-- Better navigation
-- Navigate between windows (panes) with Ctrl + h/j/k/l
map("n", "<C-h>", "<C-w>h", { desc = "Window Left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window Up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window Right" })

-- Move around in insert mode without leaving
map("i", "<C-h>", "<Left>", { desc = "Move Left in Insert" })
map("i", "<C-j>", "<Down>", { desc = "Move Down in Insert" })
map("i", "<C-k>", "<Up>", { desc = "Move Up in Insert" })
map("i", "<C-l>", "<Right>", { desc = "Move Right in Insert" })
map("i", "<C-b>", "<ESC>^i", { desc = "Move to Beginning of Line in Insert" })
-- Note: <C-e> removed to avoid conflict with blink.cmp completion menu

-- Better Indenting
map("v", "<", "<gv", { desc = "Unindent Selection" })
map("v", ">", ">gv", { desc = "Indent Selection" })

-- Make jk a consistent way to exit insert mode
map("i", "jk", "<ESC>", { desc = "Exit Insert Mode" })

-- Clear search highlights with ESC
map("n", "<ESC>", "<cmd>noh<CR>", { desc = "Clear Highlights" })

-- ## Window Management
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right" })
map("n", "<leader>qw", "<C-W>c", { desc = "Close Window" })
map("n", "<leader>wo", "<C-W>o", { desc = "Close Other Windows" })
map("n", "<leader>wt", "<C-W>T", { desc = "Move Window to New Tab" })
map("n", "<leader>wr", "<C-W>r", { desc = "Rotate Windows" })
map("n", "<leader>w=", "<C-W>=", { desc = "Equalize Window Sizes" })

-- Resize window using leader + arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- Quick window navigation with <leader>w prefix
map("n", "<leader>wh", "<C-W>h", { desc = "Go to Left Window" })
map("n", "<leader>wj", "<C-W>j", { desc = "Go to Bottom Window" })
map("n", "<leader>wk", "<C-W>k", { desc = "Go to Top Window" })
map("n", "<leader>wl", "<C-W>l", { desc = "Go to Right Window" })

-- Window movement
map("n", "<leader>wH", "<C-W>H", { desc = "Move Window Left" })
map("n", "<leader>wJ", "<C-W>J", { desc = "Move Window Down" })
map("n", "<leader>wK", "<C-W>K", { desc = "Move Window Up" })
map("n", "<leader>wL", "<C-W>L", { desc = "Move Window Right" })

-- ## File and Buffer Management
-- Grouped under leader + f (for 'file') and leader + b (for 'buffer')
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save File" })
map("i", "<C-s>", "<cmd>w<cr>", { desc = "Save File" })
map("n", "<leader>qa", "<cmd>qa<cr>", { desc = "Quit All" })

-- Neo Tree
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle File Explorer" })
map("n", "<leader>br", ":Neotree buffers reveal float<CR>", { desc = "Buffer Explorer" })

-- BufferLine
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin" })
map("n", "<leader>bo", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Delete Non-Pinned Buffers" })
map("n", "<leader>bc", "<Cmd>BufferLineCloseRight<CR>", { desc = "Delete Buffers to the Right" })
