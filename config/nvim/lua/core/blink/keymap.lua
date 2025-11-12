return {
	preset = "default",
	["<C-z>"] = { "select_and_accept" },
	["<S-Tab>"] = { "select_prev", "fallback" },
	["<Tab>"] = { "select_next", "fallback" },
	["<Up>"] = { "select_prev", "fallback" },
	["<Down>"] = { "select_next", "fallback" },
	["<C-p>"] = { "select_prev", "fallback" },
	["<C-n>"] = { "select_next", "fallback" },
	["<S-k>"] = { "scroll_documentation_up", "fallback" },
	["<S-j>"] = { "scroll_documentation_down", "fallback" },
	["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
	["<C-e>"] = { "hide", "fallback" },
}
