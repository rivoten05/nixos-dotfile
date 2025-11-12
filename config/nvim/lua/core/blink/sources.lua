return {
	default = { "lsp", "codeium", "path", "snippets", "buffer" },
	providers = {
		codeium = {
			name = "codeium",
			module = "blink.compat.source",
			score_offset = 100,
			async = true,
		},
	},
}
