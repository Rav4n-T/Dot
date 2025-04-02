return {
	{
		"stevearc/oil.nvim",
		keys = {
			{
				"<leader>o",
				function()
					require("oil").open_float()
				end,
				desc = "Explorer Oil (cwd)",
			},
		},
		opts = {},
		-- Optional dependencies
		-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},
}
