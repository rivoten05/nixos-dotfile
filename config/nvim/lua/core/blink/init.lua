local M = {}

function M.setup()
	local opts = {
		keymap = require("core.blink.keymap"),
		appearance = require("core.blink.appearance"),
		snippets = require("core.blink.snippets"),
		sources = require("core.blink.sources"),
		completion = {
			menu = {
				border = "rounded",
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind", gap = 1 },
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				window = { border = "rounded" },
			},
		},
		signature = { enabled = true, window = { border = "rounded" } },
		cmdline = {
			keymap = {
				["<Tab>"] = { "show", "accept" },
			},
			completion = { menu = { auto_show = true } },
		},
	}

	require("blink.cmp").setup(opts)
end

return M
