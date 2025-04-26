return {
	{
		"catppuccin/nvim",
		event = "VeryLazy",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true,
				show_end_of_buffer = false,
				integration_default = false,
				blink_cmp = true,
				fzf = true,
				gitsigns = true,
				noice = true,
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					-- loops = { "bold" },
					functions = { "italic" },
					-- keywords = {},
					-- strings = { "italic" },
					variables = { "italic" },
					-- numbers = {},
					-- booleans = { "bold" },
					-- properties = { "italic" },
					-- types = { "bold" },
					operators = {},
				},
			})
		end,
	},
}
