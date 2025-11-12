local ok_core, _ = pcall(require, "configs.keymaps-core")
if not ok_core then
	vim.notify("Failed to load core keymaps", vim.log.levels.WARN)
end

local ok_search, _ = pcall(require, "configs.keymaps-search")
if not ok_search then
	vim.notify("Failed to load search keymaps", vim.log.levels.WARN)
end

local ok_lsp, _ = pcall(require, "configs.keymaps-lsp")
if not ok_lsp then
	vim.notify("Failed to load LSP keymaps", vim.log.levels.WARN)
end

local ok_git, _ = pcall(require, "configs.keymaps-git")
if not ok_git then
	vim.notify("Failed to load git keymaps", vim.log.levels.WARN)
end

local ok_ui, _ = pcall(require, "configs.keymaps-ui")
if not ok_ui then
	vim.notify("Failed to load UI keymaps", vim.log.levels.WARN)
end

local ok_terminal, _ = pcall(require, "configs.keymaps-terminal")
if not ok_terminal then
	vim.notify("Failed to load terminal keymaps", vim.log.levels.WARN)
end
